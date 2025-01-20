@interface CLSImageUtils
+ (CGImage)CGImageFromJPEGData:(id)a3 error:(id *)a4;
+ (CGSize)sizeOfImageAtURL:(id)a3;
+ (id)JPEGDataForThumbnailForFileAtURL:(id)a3 maxSize:(CGSize)a4 scaleFactor:(double)a5 error:(id *)a6;
+ (id)JPEGDataFromCGImage:(CGImage *)a3 desiredMinimumDimension:(unint64_t)a4 desiredMaximumDimension:(unint64_t)a5 error:(id *)a6;
+ (id)JPEGDataFromCGImage:(CGImage *)a3 error:(id *)a4;
@end

@implementation CLSImageUtils

+ (id)JPEGDataFromCGImage:(CGImage *)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v6 = (__CFData *)objc_opt_new();
    v7 = CGImageDestinationCreateWithData(v6, @"public.jpeg", 1uLL, 0);
    if (v7)
    {
      v9 = v7;
      CGImageDestinationAddImage(v7, a3, 0);
      if (CGImageDestinationFinalize(v9) && objc_msgSend_length(v6, v10, v11))
      {
        v12 = 0;
      }
      else
      {
        v16 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v10, 100, @"CGImageDestinationFinalize failed");
        v12 = v16;
        if (a4) {
          *a4 = v16;
        }
        if (qword_1EB5D4D10 != -1) {
          dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
        }
        v17 = CLSLogDefault;
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          int v21 = 138543362;
          v22 = v12;
          _os_log_error_impl(&dword_1DC60F000, v17, OS_LOG_TYPE_ERROR, "ERROR: Error occurred in'_JPEGDataFromCGImage' %{public}@", (uint8_t *)&v21, 0xCu);
        }

        v6 = 0;
      }
      CFRelease(v9);
      v6 = v6;
      v15 = v6;
    }
    else
    {
      v18 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v8, 100, @"CGImageDestinationCreateWithData failed");
      v12 = v18;
      if (a4) {
        *a4 = v18;
      }
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      v19 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        int v21 = 138543362;
        v22 = v12;
        _os_log_error_impl(&dword_1DC60F000, v19, OS_LOG_TYPE_ERROR, "ERROR: Error occurred in'_JPEGDataFromCGImage' %{public}@", (uint8_t *)&v21, 0xCu);
      }
      v15 = 0;
    }
  }
  else
  {
    v13 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], a2, 2, @"Input image is NULL");
    v12 = v13;
    if (a4) {
      *a4 = v13;
    }
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v14 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543362;
      v22 = v12;
      _os_log_error_impl(&dword_1DC60F000, v14, OS_LOG_TYPE_ERROR, "ERROR: Error occurred in'_JPEGDataFromCGImage' %{public}@", (uint8_t *)&v21, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

+ (CGImage)CGImageFromJPEGData:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFDataRef v5 = (const __CFData *)a3;
  CFDataRef v7 = v5;
  if (!v5)
  {
    v16 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v6, 2, @"Input data is NULL");
    v13 = v16;
    if (a4) {
      *a4 = v16;
    }
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v17 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    int v20 = 138543362;
    int v21 = v13;
    goto LABEL_25;
  }
  v8 = CGImageSourceCreateWithData(v5, 0);
  if (!v8)
  {
    v18 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v9, 100, @"CGImageSourceCreateWithData failed");
    v13 = v18;
    if (a4) {
      *a4 = v18;
    }
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v17 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    int v20 = 138543362;
    int v21 = v13;
LABEL_25:
    _os_log_error_impl(&dword_1DC60F000, v17, OS_LOG_TYPE_ERROR, "ERROR: Error occurred in'_CreateImageFromJPEGData' %{public}@", (uint8_t *)&v20, 0xCu);
LABEL_22:
    ImageAtIndex = 0;
    goto LABEL_23;
  }
  v10 = v8;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, 0);
  v13 = 0;
  if (!ImageAtIndex)
  {
    v14 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v11, 100, @"CGImageSourceCreateImageAtIndex failed");
    v13 = v14;
    if (a4) {
      *a4 = v14;
    }
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v15 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138543362;
      int v21 = v13;
      _os_log_error_impl(&dword_1DC60F000, v15, OS_LOG_TYPE_ERROR, "ERROR: Error occurred in'_CreateImageFromJPEGData' %{public}@", (uint8_t *)&v20, 0xCu);
    }
  }
  CFRelease(v10);
LABEL_23:

  return ImageAtIndex;
}

+ (id)JPEGDataFromCGImage:(CGImage *)a3 desiredMinimumDimension:(unint64_t)a4 desiredMaximumDimension:(unint64_t)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v9 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], a2, 2, @"Input image is NULL", a5);
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v10 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v21 = 138543362;
    uint64_t v22 = v9;
    goto LABEL_27;
  }
  if (a5 < a4)
  {
    v9 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], a2, 2, @"desiredMaxDimension < desiredMinDimension");
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v10 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v21 = 138543362;
    uint64_t v22 = v9;
    goto LABEL_27;
  }
  size_t Height = CGImageGetHeight(a3);
  size_t Width = CGImageGetWidth(a3);
  if (Height < a4 && Width < a4)
  {
    v9 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v15, 2, @"Input image dimension is less than desiredMinDimension");
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v10 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v21 = 138543362;
    uint64_t v22 = v9;
    goto LABEL_27;
  }
  if (Width > a5 || Height > a5) {
    uint64_t Thumb = CGImageCreateThumb();
  }
  else {
    uint64_t Thumb = (uint64_t)CGImageRetain(a3);
  }
  v18 = (CGImage *)Thumb;
  if (Thumb)
  {
    v19 = objc_msgSend_JPEGDataFromCGImage_error_(a1, v17, Thumb, a6);
    CGImageRelease(v18);
    goto LABEL_31;
  }
  v9 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v17, 2, @"Failed to create thumbnail image from input image");
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  v10 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    int v21 = 138543362;
    uint64_t v22 = v9;
LABEL_27:
    _os_log_error_impl(&dword_1DC60F000, v10, OS_LOG_TYPE_ERROR, "ERROR: Error occurred in 'JPEGThumbnailDataFromCGImage:...' %{public}@", (uint8_t *)&v21, 0xCu);
  }
LABEL_28:
  if (a6) {
    *a6 = v9;
  }

  v19 = 0;
LABEL_31:

  return v19;
}

+ (id)JPEGDataForThumbnailForFileAtURL:(id)a3 maxSize:(CGSize)a4 scaleFactor:(double)a5 error:(id *)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_1DC66CE04;
  v48 = sub_1DC66CE14;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_1DC66CE04;
  v42 = sub_1DC66CE14;
  id v43 = 0;
  id v12 = objc_alloc(MEMORY[0x1E4F3A6C0]);
  v14 = objc_msgSend_initWithFileAtURL_size_scale_representationTypes_(v12, v13, (uint64_t)v11, 4, width, height, a5);
  objc_msgSend_setBadgeType_(v14, v15, 0);
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &unk_1F37A1690);
  v19 = objc_msgSend_sharedGenerator(MEMORY[0x1E4F3A6C8], v17, v18);
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = sub_1DC66CE20;
  v33 = &unk_1E6C97180;
  v35 = &v38;
  id v20 = v16;
  id v34 = v20;
  v36 = &v44;
  id v37 = a1;
  objc_msgSend_generateBestRepresentationForRequest_completionHandler_(v19, v21, (uint64_t)v14, &v30);

  dispatch_time_t v22 = dispatch_time(0, 60000000000);
  if (dispatch_block_wait(v20, v22))
  {
    uint64_t v24 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v23, 320, @"Timed out JPEGDataForThumbnailForFileAtURL!", v30, v31, v32, v33);
    v25 = (void *)v39[5];
    v39[5] = v24;

    objc_msgSend_cls_log_((void *)v39[5], v26, CLSLogDefault);
  }
  if (a6)
  {
    v27 = (void *)v39[5];
    if (v27) {
      *a6 = v27;
    }
  }
  id v28 = (id)v45[5];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v28;
}

+ (CGSize)sizeOfImageAtURL:(id)a3
{
  v3 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v3)
  {
    v4 = v3;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v3, 0, 0);
    if (ImageAtIndex)
    {
      v6 = ImageAtIndex;
      double Width = (double)CGImageGetWidth(ImageAtIndex);
      double Height = (double)CGImageGetHeight(v6);
      CGImageRelease(v6);
    }
    else
    {
      double Height = 0.0;
      double Width = 0.0;
    }
    CFRelease(v4);
  }
  else
  {
    double Height = 0.0;
    double Width = 0.0;
  }
  double v9 = Width;
  double v10 = Height;
  result.double height = v10;
  result.double width = v9;
  return result;
}

@end