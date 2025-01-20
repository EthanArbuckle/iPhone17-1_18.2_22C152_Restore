@interface ETMessageImageEncoder
+ (BOOL)createVideoForMessage:(id)a3 atURL:(id)a4 completionBlock:(id)a5;
+ (BOOL)createVideoWithIntroMessage:(id)a3 playingMessagesArray:(id)a4 sourceVideoURL:(id)a5 destinationURL:(id)a6 completionBlock:(id)a7;
+ (void)_drawImageFromPath:(id)a3 intoContext:(CGContext *)a4;
+ (void)_finishedWritingAtURL:(id)a3 withSuccess:(BOOL)a4 completionBlock:(id)a5;
+ (void)createSingleFrameVideoFromPhotoURL:(id)a3 atTempURL:(id)a4 videoSize:(CGSize)a5 forMessage:(id)a6 withCompletion:(id)a7;
- (CGImage)_createImageForMessage:(id)a3;
- (void)fallbackForData:(id)a3 attachments:(id)a4 inFileURL:(id)a5 completionBlockWithText:(id)a6;
@end

@implementation ETMessageImageEncoder

- (void)fallbackForData:(id)a3 attachments:(id)a4 inFileURL:(id)a5 completionBlockWithText:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v57 = a5;
  id v12 = a6;
  if (v12)
  {
    v13 = +[ETMessage unarchive:v10];
    unsigned int v14 = [v13 messageType];
    if (v14 == 8)
    {
      if (![v11 count]
        || ([v11 objectAtIndexedSubscript:0],
            v15 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v15,
            (isKindOfClass & 1) == 0))
      {
        if (IMOSLoggingEnabled())
        {
          v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Not generating fallback video. Video/Photo message contains no attachment or non-NSURL object.", buf, 2u);
          }
        }
        (*((void (**)(id, void, void, void, void, uint64_t))v12 + 2))(v12, 0, 0, 0, 0, 1);
        goto LABEL_39;
      }
      v56 = [v11 objectAtIndexedSubscript:0];
      v17 = +[NSFileManager defaultManager];
      v18 = [v56 path];
      unsigned __int8 v19 = [v17 fileExistsAtPath:v18];

      if ((v19 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          v42 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v43 = [v56 absoluteString];
            *(_DWORD *)buf = 138412290;
            v65 = v43;
            _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "IMTranscoderAgent can't generate fallback asset because the attachment URL doesn't yet exist: %@", buf, 0xCu);
          }
        }
        (*((void (**)(id, void, void, void, void, uint64_t))v12 + 2))(v12, 0, 0, 0, 0, 1);
        goto LABEL_38;
      }
      id v20 = v13;
      v21 = [v20 identifier];
      v22 = +[NSString stringWithFormat:@"%@.mov", v21];
      v55 = [v57 URLByAppendingPathComponent:v22];

      if ([v20 mediaType] == (char *)&dword_0 + 2)
      {
        v23 = [v20 introMessage];
        if (v23)
        {
        }
        else
        {
          v45 = [v20 playingMessages];
          id v46 = [v45 count];

          if (!v46)
          {
            v52 = [v11 objectAtIndexedSubscript:0];
            v63 = v52;
            v53 = +[NSArray arrayWithObjects:&v63 count:1];
            (*((void (**)(id, void *, void, void, uint64_t, uint64_t))v12 + 2))(v12, v53, 0, 0, 1, 1);

            goto LABEL_37;
          }
        }
        v47 = NSTemporaryDirectory();
        v48 = [v20 identifier];
        v49 = +[NSString stringWithFormat:@"Image-%@.mov", v48];
        v50 = [v47 stringByAppendingPathComponent:v49];
        v54 = +[NSURL fileURLWithPath:v50];

        [v20 setMediaURL:v54];
        v51 = [v11 objectAtIndexedSubscript:0];
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_11918;
        v58[3] = &unk_24B50;
        id v59 = v20;
        id v60 = v55;
        id v61 = v12;
        +[ETMessageImageEncoder createSingleFrameVideoFromPhotoURL:atTempURL:videoSize:forMessage:withCompletion:](ETMessageImageEncoder, "createSingleFrameVideoFromPhotoURL:atTempURL:videoSize:forMessage:withCompletion:", v51, v54, v59, v58, 480.0, 600.0);
      }
      else
      {
        v44 = [v11 objectAtIndexedSubscript:0];
        [v20 setMediaURL:v44];

        +[ETMessageImageEncoder createVideoForMessage:v20 atURL:v55 completionBlock:v12];
      }
LABEL_37:

LABEL_38:
      goto LABEL_39;
    }
    unsigned int v24 = v14;
    v25 = [v13 identifier];
    v26 = +[NSString stringWithFormat:@"%@.png", v25];
    CFURLRef v27 = [v57 URLByAppendingPathComponent:v26];

    if (v24 == 10)
    {
      v30 = @"PrerenderedAnger";
    }
    else
    {
      if (v24 != 2)
      {
        CGImageDestinationRef v38 = CGImageDestinationCreateWithURL(v27, kUTTypePNG, 1uLL, 0);
        if (!v38) {
          goto LABEL_33;
        }
        CGImageDestinationRef v39 = v38;
        v40 = [(ETMessageImageEncoder *)self _createImageForMessage:v13];
        if (!v40)
        {
          CFRelease(v39);
          goto LABEL_33;
        }
        v41 = v40;
        CGImageDestinationAddImage(v39, v40, 0);
        unsigned __int8 v36 = CGImageDestinationFinalize(v39);
        CFRelease(v39);
        CFRelease(v41);
LABEL_21:
        if (v36)
        {
          CFURLRef v62 = v27;
          v37 = +[NSArray arrayWithObjects:&v62 count:1];
          (*((void (**)(id, void *, void, void, uint64_t, uint64_t))v12 + 2))(v12, v37, 0, 0, 1, 1);

LABEL_39:
          goto LABEL_40;
        }
LABEL_33:
        (*((void (**)(id, void, void, void, void, uint64_t))v12 + 2))(v12, 0, 0, 0, 0, 1);

        goto LABEL_39;
      }
      [v13 heartbreakTime];
      v28 = @"PrerenderedHeartbeat";
      if (v29 != 0.0) {
        v28 = @"PrerenderedHeartbreak";
      }
      v30 = v28;
    }
    v32 = +[NSBundle bundleForClass:objc_opt_class()];
    v33 = +[UIImage imageNamed:v30 inBundle:v32];

    v34 = UIImagePNGRepresentation(v33);
    v35 = [(__CFURL *)v27 path];
    unsigned __int8 v36 = [v34 writeToFile:v35 atomically:1];

    goto LABEL_21;
  }
LABEL_40:
}

- (CGImage)_createImageForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  [v4 setRenderingOffscreen:1];
  v5 = +[UIScreen mainScreen];
  [v5 scale];
  double v7 = v6;

  unsigned int v8 = [v4 messageType];
  if (v8 <= 0xA)
  {
    double v9 = ETMessageRenderBufferWidth / v7;
    double v10 = ETMessageRenderBufferHeight / v7;
    if (((1 << v8) & 0x605) != 0)
    {
      v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      v23 = sub_11BE0;
      unsigned int v24 = &unk_24B78;
      double v27 = v9;
      double v28 = v10;
      id v25 = v4;
      v26 = &v29;
      id v11 = objc_retainBlock(&v21);
      if (+[NSThread isMainThread]) {
        ((void (*)(void ***))v11[2])(v11);
      }
      else {
        dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v11);
      }

      id v12 = v25;
      goto LABEL_12;
    }
    if (v8 == 1)
    {
      [v4 setRenderingOffscreen:1];
      id v12 = objc_msgSend(objc_alloc((Class)ETGLSketchView), "initWithFrame:", 0.0, 0.0, v9, v10);
      [v12 setMessageData:v4];
      unsigned __int8 v19 = [v4 color];
      [v4 setColor:v19];

      [v12 drawFrameBeforeWisp];
      id v20 = [v12 createRenderedFrameImage];
      v30[3] = (uint64_t)v20;
LABEL_12:

      goto LABEL_13;
    }
    if (v8 == 8)
    {
      id v12 = v4;
      v13 = [v12 introMessage];
      unsigned int v14 = [v12 playingMessages];
      v15 = v14;
      if (v13
        || [v14 count]
        && ([v15 objectAtIndex:0], (v13 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v16 = [(ETMessageImageEncoder *)self _createImageForMessage:v13];
        v30[3] = (uint64_t)v16;
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  v17 = (CGImage *)v30[3];
  _Block_object_dispose(&v29, 8);

  return v17;
}

+ (void)_finishedWritingAtURL:(id)a3 withSuccess:(BOOL)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v9 = (void (**)(void, void, void, void, void, void))v8;
  if (v8)
  {
    if (a4)
    {
      id v11 = v7;
      double v10 = +[NSArray arrayWithObjects:&v11 count:1];
      ((void (**)(void, void *, void, void, uint64_t, uint64_t))v9)[2](v9, v10, 0, 0, 1, 1);
    }
    else
    {
      (*((void (**)(id, void, void, void, void, uint64_t))v8 + 2))(v8, 0, 0, 0, 0, 1);
    }
  }
}

+ (void)_drawImageFromPath:(id)a3 intoContext:(CGContext *)a4
{
  v5 = +[UIImage imageWithContentsOfFile:a3];
  CGFloat Width = (double)CGBitmapContextGetWidth(a4);
  CGFloat Height = (double)CGBitmapContextGetHeight(a4);
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v13.c = v8;
  *(_OWORD *)&v13.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&transform.a = *(_OWORD *)&v13.a;
  *(_OWORD *)&transform.c = v8;
  *(_OWORD *)&transform.tx = *(_OWORD *)&v13.tx;
  CGAffineTransformRotate(&v13, &transform, -1.57079633);
  CGAffineTransform v11 = v13;
  CGAffineTransformTranslate(&transform, &v11, -Height, 0.0);
  CGAffineTransform v13 = transform;
  CGContextConcatCTM(a4, &transform);
  id v9 = v5;
  double v10 = (CGImage *)[v9 CGImage];
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = Height;
  v14.size.height = Width;
  CGContextDrawImage(a4, v14, v10);
}

+ (void)createSingleFrameVideoFromPhotoURL:(id)a3 atTempURL:(id)a4 videoSize:(CGSize)a5 forMessage:(id)a6 withCompletion:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  id v45 = a3;
  id v12 = a4;
  id v13 = a6;
  CGRect v14 = (void (**)(void, double))a7;
  id v62 = 0;
  v42 = v12;
  id v15 = [objc_alloc((Class)AVAssetWriter) initWithURL:v12 fileType:AVFileTypeQuickTimeMovie error:&v62];
  id v43 = v62;
  v70[0] = AVVideoCodecTypeH264;
  v69[0] = AVVideoCodecKey;
  v69[1] = AVVideoWidthKey;
  v16 = +[NSNumber numberWithDouble:width];
  v70[1] = v16;
  v69[2] = AVVideoHeightKey;
  v17 = +[NSNumber numberWithDouble:height];
  v70[2] = v17;
  v69[3] = AVVideoScalingModeKey;
  v70[3] = AVVideoScalingModeResizeAspectFill;
  v44 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:4];

  id v18 = [objc_alloc((Class)AVAssetWriterInput) initWithMediaType:AVMediaTypeVideo outputSettings:v44];
  [v15 addInput:v18];
  v68[0] = &off_256B0;
  v67[0] = kCVPixelBufferPixelFormatTypeKey;
  v67[1] = kCVPixelBufferBytesPerRowAlignmentKey;
  unsigned __int8 v19 = +[NSNumber numberWithDouble:width * 4.0];
  v68[1] = v19;
  v67[2] = kCVPixelBufferWidthKey;
  id v20 = +[NSNumber numberWithDouble:width];
  v68[2] = v20;
  v67[3] = kCVPixelBufferHeightKey;
  v21 = +[NSNumber numberWithDouble:height];
  v68[3] = v21;
  v67[4] = kCVPixelBufferCGImageCompatibilityKey;
  v67[5] = kCVPixelBufferCGBitmapContextCompatibilityKey;
  v68[4] = &__kCFBooleanTrue;
  v68[5] = &__kCFBooleanTrue;
  uint64_t v22 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:6];

  id v23 = [objc_alloc((Class)AVAssetWriterInputPixelBufferAdaptor) initWithAssetWriterInput:v18 sourcePixelBufferAttributes:v22];
  [v15 startWriting];
  *(_OWORD *)buf = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [v15 startSessionAtSourceTime:buf];
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferPoolCreatePixelBuffer(0, (CVPixelBufferPoolRef)[v23 pixelBufferPool], &pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v26 = CGBitmapContextCreate(BaseAddress, (unint64_t)width, (unint64_t)height, 8uLL, (unint64_t)(width * 4.0), DeviceRGB, 0x2002u);
  if (v45)
  {
    double v27 = objc_opt_class();
    double v28 = [v45 path];
    [v27 _drawImageFromPath:v28 intoContext:v26];
  }
  else
  {
    id v29 = +[UIColor blackColor];
    CGContextSetFillColorWithColor(v26, (CGColorRef)[v29 CGColor]);

    v71.origin.x = 0.0;
    v71.origin.y = 0.0;
    v71.size.double width = width;
    v71.size.double height = height;
    CGContextFillRect(v26, v71);
  }
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v26);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  if (pixelBufferOut) {
    goto LABEL_5;
  }
  if (IMOSLoggingEnabled())
  {
    v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      CGImageDestinationRef v38 = [v13 identifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v38;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Pixel buffer couldn't be created for message id: %@! Please file a bug.", buf, 0xCu);
    }
  }
  if (!v14)
  {
LABEL_5:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      v30 = [v13 playingMessages];
      id v31 = [v30 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v58;
        double v33 = 0.0;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v58 != v32) {
              objc_enumerationMutation(v30);
            }
            [*(id *)(*((void *)&v57 + 1) + 8 * i) messageDuration];
            double v33 = v33 + v35;
          }
          id v31 = [v30 countByEnumeratingWithState:&v57 objects:v66 count:16];
        }
        while (v31);
      }
      else
      {
        double v33 = 0.0;
      }
    }
    else
    {
      [v13 messageDuration];
      double v33 = v36;
    }
    double v39 = v33 + 0.5;
    if (v33 + 0.5 == 0.0)
    {
      if (v14)
      {
        v14[2](v14, v39);
        goto LABEL_27;
      }
      double v39 = 10.0;
    }
    unint64_t v40 = (unint64_t)(v39 * 60.0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    CMTimeEpoch epoch = 0x2020000000;
    uint64_t v65 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    char v56 = 0;
    dispatch_queue_t v41 = dispatch_queue_create("com.apple.DigitalTouchFallbackVideoWriter", 0);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_12680;
    v46[3] = &unk_24BC8;
    v51 = v55;
    id v47 = v18;
    v52 = buf;
    unint64_t v53 = v40;
    id v48 = v23;
    CVPixelBufferRef v54 = pixelBufferOut;
    id v49 = v15;
    v50 = v14;
    [v47 requestMediaDataWhenReadyOnQueue:v41 usingBlock:v46];

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    ((void (*)(void (**)(void, double)))v14[2])(v14);
  }
LABEL_27:
}

+ (BOOL)createVideoForMessage:(id)a3 atURL:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  CGAffineTransform v11 = [v10 introMessage];
  id v12 = [v10 playingMessages];
  id v13 = [v10 mediaURL];

  LOBYTE(v10) = [a1 createVideoWithIntroMessage:v11 playingMessagesArray:v12 sourceVideoURL:v13 destinationURL:v9 completionBlock:v8];
  return (char)v10;
}

+ (BOOL)createVideoWithIntroMessage:(id)a3 playingMessagesArray:(id)a4 sourceVideoURL:(id)a5 destinationURL:(id)a6 completionBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (a5)
  {
    id v15 = +[AVAsset assetWithURL:a5];
    v16 = v15;
    if (v15)
    {
      v17 = [v15 tracksWithMediaType:AVMediaTypeVideo];
      id v18 = [v17 lastObject];

      if (v18)
      {
        id v19 = [objc_alloc((Class)AVAssetExportSession) initWithAsset:v16 presetName:AVAssetExportPresetMediumQuality];
        if (v19)
        {
          id v20 = +[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:v16];
          LOBYTE(a5) = v20 != 0;
          if (v20)
          {
            [v20 setCustomVideoCompositorClass:objc_opt_class()];
            [v19 setVideoComposition:v20];
            [v19 setOutputFileType:AVFileTypeQuickTimeMovie];
            [v19 setOutputURL:v13];
            [v18 naturalSize];
            double v23 = v21;
            double v24 = v22;
            v44 = v18;
            v42 = v20;
            if (v11)
            {
              id v25 = -[ETMessageFrameRenderer initWithMessage:videoFrame:]([ETMessageFrameRenderer alloc], "initWithMessage:videoFrame:", v11, 0.0, 0.0, v21, v22);
              dispatch_queue_t v41 = [(ETMessageFrameRenderer *)v25 createImageForTime:10000.0];
            }
            else
            {
              dispatch_queue_t v41 = 0;
            }
            id v43 = v19;
            v26 = [v19 customVideoCompositor];
            double v27 = +[NSMutableArray array];
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v28 = v12;
            id v29 = [v28 countByEnumeratingWithState:&v50 objects:v54 count:16];
            if (v29)
            {
              id v30 = v29;
              id v39 = v14;
              id v40 = v11;
              uint64_t v31 = *(void *)v51;
              while (1)
              {
                for (i = 0; i != v30; i = (char *)i + 1)
                {
                  if (*(void *)v51 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  double v33 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                  unsigned int v34 = [v33 messageType];
                  if (v34 <= 0xA)
                  {
                    if (((1 << v34) & 0x605) != 0)
                    {
                      double v35 = -[ETMessageFrameRenderer initWithMessage:videoFrame:]([ETMessageFrameRenderer alloc], "initWithMessage:videoFrame:", v33, 0.0, 0.0, v23, v24);
                      [v27 addObject:v35];
                    }
                    else
                    {
                      if (v34 != 1) {
                        continue;
                      }
                      double v35 = -[ETMessageFrameRenderer initWithMessage:videoFrame:]([ETMessageFrameRenderer alloc], "initWithMessage:videoFrame:", v33, 0.0, 0.0, v23, v24);
                      [v26 setSketchMessageRenderer:v35];
                    }
                  }
                }
                id v30 = [v28 countByEnumeratingWithState:&v50 objects:v54 count:16];
                if (!v30)
                {
                  id v11 = v40;
                  id v14 = v39;
                  break;
                }
              }
            }

            id v18 = v44;
            objc_msgSend(v26, "setVideoTrackID:", objc_msgSend(v44, "trackID"));
            [v44 preferredTransform];
            [v26 setVideoTransform:v49];
            objc_msgSend(v26, "setVideoRect:", 0.0, 0.0, v23, v24);
            [v26 setIntroImage:v41];
            if ([v27 count]) {
              double v36 = v27;
            }
            else {
              double v36 = 0;
            }
            [v26 setSceneMessageRenderers:v36];
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = sub_12DFC;
            v45[3] = &unk_24BF0;
            id v46 = v43;
            id v47 = v26;
            id v48 = v14;
            id v37 = v26;
            [v46 exportAsynchronouslyWithCompletionHandler:v45];

            id v19 = v43;
            LOBYTE(a5) = 1;
            id v20 = v42;
          }
          else
          {
            +[ETMessageImageEncoder _finishedWritingAtURL:v13 withSuccess:0 completionBlock:v14];
          }
        }
        else
        {
          +[ETMessageImageEncoder _finishedWritingAtURL:v13 withSuccess:0 completionBlock:v14];
          LOBYTE(a5) = 0;
        }
      }
      else
      {
        +[ETMessageImageEncoder _finishedWritingAtURL:v13 withSuccess:0 completionBlock:v14];
        LOBYTE(a5) = 0;
      }
    }
    else
    {
      +[ETMessageImageEncoder _finishedWritingAtURL:v13 withSuccess:0 completionBlock:v14];
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    +[ETMessageImageEncoder _finishedWritingAtURL:v13 withSuccess:0 completionBlock:v14];
  }

  return (char)a5;
}

@end