@interface RPCCUIVideoView
+ (Class)layerClass;
- (RPCCUIVideoView)init;
- (void)applyTransformForExternalCamera;
- (void)applyTransformForPortrait;
- (void)applyTransformWithOrientation;
- (void)applyTransformationForLandscapeLeft;
- (void)applyTransformationForLandscapeRight;
- (void)applyTransformationForPortraitUpsideDown;
- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)flushVideoView;
@end

@implementation RPCCUIVideoView

- (RPCCUIVideoView)init
{
  v9.receiver = self;
  v9.super_class = (Class)RPCCUIVideoView;
  v2 = [(RPCCUIVideoView *)&v9 init];
  v3 = v2;
  if (v2)
  {
    currentRotation = v2->_currentRotation;
    v2->_currentRotation = (NSNumber *)&off_6B228;

    v3->_mirrorType = 0;
    v3->_orientation = 0;
    portType = v3->_portType;
    v3->_portType = (NSString *)&stru_69FF8;

    deviceType = v3->_deviceType;
    v3->_deviceType = (NSNumber *)&off_6B228;

    [(RPCCUIVideoView *)v3 setClipsToBounds:1];
    v7 = [(RPCCUIVideoView *)v3 layer];
    [v7 setVideoGravity:AVLayerVideoGravityResizeAspectFill];
  }
  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)flushVideoView
{
  id v2 = [(RPCCUIVideoView *)self layer];
  [v2 flushAndRemoveImage];
}

- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CFDictionaryRef v5 = CMCopyDictionaryOfAttachments(kCFAllocatorDefault, a3, 1u);
  CFDictionaryRef v6 = v5;
  if (!v5)
  {
    id v11 = [UIApp activeInterfaceOrientation];
    int v28 = 0;
    v12 = &stru_69FF8;
    v10 = &off_6B228;
    v13 = (NSNumber *)&off_6B228;
    goto LABEL_18;
  }
  v7 = CFDictionaryGetValue(v5, @"MetadataDictionary");
  v8 = v7;
  if (v7)
  {
    objc_super v9 = [v7 objectForKeyedSubscript:@"RotationDegrees"];

    if (v9)
    {
      v10 = [v8 objectForKeyedSubscript:@"RotationDegrees"];
    }
    else
    {
      v10 = &off_6B228;
    }
    v14 = [v8 objectForKeyedSubscript:@"MirroredVertical"];

    if (v14)
    {
      int v15 = 1;
    }
    else
    {
      v16 = [v8 objectForKeyedSubscript:@"MirroredHorizontal"];
      BOOL v17 = v16 != 0;

      int v15 = 2 * v17;
    }
    int v28 = v15;
    v18 = [v8 objectForKeyedSubscript:@"PortType"];

    if (v18)
    {
      v12 = [v8 objectForKeyedSubscript:@"PortType"];
    }
    else
    {
      v12 = &stru_69FF8;
    }
    v19 = [v8 objectForKeyedSubscript:@"DeviceType"];

    if (v19)
    {
      v13 = [v8 objectForKeyedSubscript:@"DeviceType"];
    }
    else
    {
      v13 = (NSNumber *)&off_6B228;
    }
  }
  else
  {
    int v28 = 0;
    v12 = &stru_69FF8;
    v13 = (NSNumber *)&off_6B228;
    v10 = &off_6B228;
  }

  id v11 = [UIApp activeInterfaceOrientation];
  if (v10)
  {
LABEL_18:
    if (![(NSNumber *)self->_currentRotation isEqualToNumber:v10]) {
      goto LABEL_23;
    }
  }
  if (v28 == self->_mirrorType
    && self->_orientation == v11
    && [(__CFString *)v12 isEqualToString:self->_portType]
    && v13 == self->_deviceType)
  {
    goto LABEL_35;
  }
LABEL_23:
  v20 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    currentRotation = self->_currentRotation;
    int64_t orientation = self->_orientation;
    *(_DWORD *)buf = 138413570;
    v31 = currentRotation;
    __int16 v32 = 2112;
    v33 = v10;
    __int16 v34 = 1024;
    int v35 = v28;
    __int16 v36 = 2048;
    int64_t v37 = orientation;
    __int16 v38 = 2112;
    v39 = v12;
    __int16 v40 = 2112;
    v41 = v13;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "currentRotation=%@ newRotation=%@ mirrorType=%d orientation=%ld portType=%@ deviceType=%@", buf, 0x3Au);
  }
  objc_storeStrong((id *)&self->_currentRotation, v10);
  self->_mirrorType = v28;
  self->_int64_t orientation = (int64_t)v11;
  objc_storeStrong((id *)&self->_portType, v12);
  objc_storeStrong((id *)&self->_deviceType, v13);
  if ([(NSNumber *)v13 intValue] == 15
    && [(__CFString *)v12 isEqualToString:@"PortTypeFront"])
  {
    v23 = RPCCUILogModule;
    if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "external camera", buf, 2u);
    }
    [(RPCCUIVideoView *)self applyTransformForExternalCamera];
    if (!v6) {
      goto LABEL_37;
    }
LABEL_36:
    CFRelease(v6);
    goto LABEL_37;
  }
  unsigned int v24 = [(__CFString *)v12 isEqualToString:@"PortTypeBack"];
  v25 = RPCCUILogModule;
  BOOL v26 = os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "back camera", buf, 2u);
    }
    [(RPCCUIVideoView *)self applyTransformWithOrientation];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5764;
    block[3] = &unk_68F10;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
LABEL_35:
    if (!v6) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  if (v26)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "front camera", buf, 2u);
  }
  [(RPCCUIVideoView *)self applyTransformWithOrientation];
  if (v6) {
    goto LABEL_36;
  }
LABEL_37:
  v27 = [(RPCCUIVideoView *)self layer];
  [v27 enqueueSampleBuffer:a3];
}

- (void)applyTransformForExternalCamera
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5920;
  block[3] = &unk_68F10;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)applyTransformWithOrientation
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5E34;
  block[3] = &unk_68F10;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)applyTransformForPortrait
{
  if ([(NSNumber *)self->_currentRotation isEqualToNumber:&off_6B240])
  {
    memset(&v35, 0, sizeof(v35));
    long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v3;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v35, &v34, 0.0);
    int mirrorType = self->_mirrorType;
    if (mirrorType)
    {
      if (mirrorType != 1) {
        return;
      }
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v33, &v34, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v32 = v33;
      v7 = &v32;
    }
    else
    {
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v31, &v34, -1.0, 1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v30 = v31;
      v7 = &v30;
    }
  }
  else if ([(NSNumber *)self->_currentRotation isEqualToNumber:&off_6B270])
  {
    memset(&v35, 0, sizeof(v35));
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v8;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v35, &v34, -1.57079633);
    int v9 = self->_mirrorType;
    if (v9 == 2)
    {
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v27, &v34, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v26 = v27;
      v7 = &v26;
    }
    else
    {
      CGAffineTransform v34 = v35;
      if (v9 == 1)
      {
        CGAffineTransformScale(&v29, &v34, 1.0, 1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v28 = v29;
        v7 = &v28;
      }
      else
      {
        CGAffineTransformScale(&v25, &v34, 1.0, -1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v24 = v25;
        v7 = &v24;
      }
    }
  }
  else if ([(NSNumber *)self->_currentRotation isEqualToNumber:&off_6B258])
  {
    memset(&v35, 0, sizeof(v35));
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v10;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v35, &v34, 0.0);
    int v11 = self->_mirrorType;
    if (v11)
    {
      if (v11 != 2) {
        return;
      }
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v23, &v34, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v22 = v23;
      v7 = &v22;
    }
    else
    {
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v21, &v34, 1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v20 = v21;
      v7 = &v20;
    }
  }
  else
  {
    memset(&v35, 0, sizeof(v35));
    long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v12;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v35, &v34, 1.57079633);
    int v13 = self->_mirrorType;
    if (v13 == 2)
    {
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v17, &v34, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v16 = v17;
      v7 = &v16;
    }
    else
    {
      CGAffineTransform v34 = v35;
      if (v13 == 1)
      {
        CGAffineTransformScale(&v19, &v34, 1.0, 1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v18 = v19;
        v7 = &v18;
      }
      else
      {
        CGAffineTransformScale(&v15, &v34, 1.0, -1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v14 = v15;
        v7 = &v14;
      }
    }
  }
  objc_msgSend(v5, "setAffineTransform:", v7, *(_OWORD *)&v14.a, *(_OWORD *)&v14.c, *(_OWORD *)&v14.tx);
}

- (void)applyTransformationForLandscapeRight
{
  if ([(NSNumber *)self->_currentRotation isEqualToNumber:&off_6B240])
  {
    memset(&v37, 0, sizeof(v37));
    long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v36.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v36.c = v3;
    *(_OWORD *)&v36.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v37, &v36, -1.57079633);
    int mirrorType = self->_mirrorType;
    if (mirrorType == 2)
    {
      CGAffineTransform v36 = v37;
      CGAffineTransformScale(&v33, &v36, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v32 = v33;
      v7 = &v32;
    }
    else
    {
      CGAffineTransform v36 = v37;
      if (mirrorType == 1)
      {
        CGAffineTransformScale(&v35, &v36, 1.0, 1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v34 = v35;
        v7 = &v34;
      }
      else
      {
        CGAffineTransformScale(&v31, &v36, 1.0, -1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v30 = v31;
        v7 = &v30;
      }
    }
  }
  else if ([(NSNumber *)self->_currentRotation isEqualToNumber:&off_6B270])
  {
    memset(&v37, 0, sizeof(v37));
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v36.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v36.c = v8;
    *(_OWORD *)&v36.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v37, &v36, -3.14159265);
    int v9 = self->_mirrorType;
    if (v9)
    {
      CGAffineTransform v36 = v37;
      if (v9 == 2)
      {
        CGAffineTransformScale(&v29, &v36, 1.0, 1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v28 = v29;
        v7 = &v28;
      }
      else
      {
        CGAffineTransformScale(&v25, &v36, 1.0, 1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v24 = v25;
        v7 = &v24;
      }
    }
    else
    {
      CGAffineTransform v36 = v37;
      CGAffineTransformScale(&v27, &v36, -1.0, 1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v26 = v27;
      v7 = &v26;
    }
  }
  else if ([(NSNumber *)self->_currentRotation isEqualToNumber:&off_6B258])
  {
    memset(&v37, 0, sizeof(v37));
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v36.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v36.c = v10;
    *(_OWORD *)&v36.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v37, &v36, 1.57079633);
    int v11 = self->_mirrorType;
    if (v11 == 2)
    {
      CGAffineTransform v36 = v37;
      CGAffineTransformScale(&v21, &v36, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v20 = v21;
      v7 = &v20;
    }
    else
    {
      CGAffineTransform v36 = v37;
      if (v11 == 1)
      {
        CGAffineTransformScale(&v23, &v36, 1.0, 1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v22 = v23;
        v7 = &v22;
      }
      else
      {
        CGAffineTransformScale(&v19, &v36, 1.0, -1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v18 = v19;
        v7 = &v18;
      }
    }
  }
  else
  {
    memset(&v37, 0, sizeof(v37));
    long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v36.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v36.c = v12;
    *(_OWORD *)&v36.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v37, &v36, 0.0);
    int v13 = self->_mirrorType;
    if (v13)
    {
      if (v13 != 1) {
        return;
      }
      CGAffineTransform v36 = v37;
      CGAffineTransformScale(&v17, &v36, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v16 = v17;
      v7 = &v16;
    }
    else
    {
      CGAffineTransform v36 = v37;
      CGAffineTransformScale(&v15, &v36, -1.0, 1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v14 = v15;
      v7 = &v14;
    }
  }
  objc_msgSend(v5, "setAffineTransform:", v7, *(_OWORD *)&v14.a, *(_OWORD *)&v14.c, *(_OWORD *)&v14.tx);
}

- (void)applyTransformationForPortraitUpsideDown
{
  if ([(NSNumber *)self->_currentRotation isEqualToNumber:&off_6B240])
  {
    memset(&v35, 0, sizeof(v35));
    long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v3;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v35, &v34, -3.14159265);
    int mirrorType = self->_mirrorType;
    if (mirrorType)
    {
      if (mirrorType != 2) {
        return;
      }
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v33, &v34, 1.0, 1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v32 = v33;
      v7 = &v32;
    }
    else
    {
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v31, &v34, -1.0, 1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v30 = v31;
      v7 = &v30;
    }
  }
  else if ([(NSNumber *)self->_currentRotation isEqualToNumber:&off_6B270])
  {
    memset(&v35, 0, sizeof(v35));
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v8;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v35, &v34, 1.57079633);
    int v9 = self->_mirrorType;
    if (v9 == 2)
    {
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v27, &v34, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v26 = v27;
      v7 = &v26;
    }
    else
    {
      CGAffineTransform v34 = v35;
      if (v9 == 1)
      {
        CGAffineTransformScale(&v29, &v34, 1.0, 1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v28 = v29;
        v7 = &v28;
      }
      else
      {
        CGAffineTransformScale(&v25, &v34, 1.0, -1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v24 = v25;
        v7 = &v24;
      }
    }
  }
  else if ([(NSNumber *)self->_currentRotation isEqualToNumber:&off_6B258])
  {
    memset(&v35, 0, sizeof(v35));
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v10;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v35, &v34, 0.0);
    int v11 = self->_mirrorType;
    if (v11)
    {
      if (v11 != 1) {
        return;
      }
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v23, &v34, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v22 = v23;
      v7 = &v22;
    }
    else
    {
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v21, &v34, -1.0, 1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v20 = v21;
      v7 = &v20;
    }
  }
  else
  {
    memset(&v35, 0, sizeof(v35));
    long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v12;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v35, &v34, -1.57079633);
    int v13 = self->_mirrorType;
    if (v13 == 2)
    {
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v17, &v34, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v16 = v17;
      v7 = &v16;
    }
    else
    {
      CGAffineTransform v34 = v35;
      if (v13 == 1)
      {
        CGAffineTransformScale(&v19, &v34, 1.0, 1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v18 = v19;
        v7 = &v18;
      }
      else
      {
        CGAffineTransformScale(&v15, &v34, 1.0, -1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v14 = v15;
        v7 = &v14;
      }
    }
  }
  objc_msgSend(v5, "setAffineTransform:", v7, *(_OWORD *)&v14.a, *(_OWORD *)&v14.c, *(_OWORD *)&v14.tx);
}

- (void)applyTransformationForLandscapeLeft
{
  if ([(NSNumber *)self->_currentRotation isEqualToNumber:&off_6B240])
  {
    memset(&v35, 0, sizeof(v35));
    long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v3;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v35, &v34, 1.57079633);
    int mirrorType = self->_mirrorType;
    if (mirrorType == 2)
    {
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v31, &v34, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v30 = v31;
      v7 = &v30;
    }
    else
    {
      CGAffineTransform v34 = v35;
      if (mirrorType == 1)
      {
        CGAffineTransformScale(&v33, &v34, 1.0, 1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v32 = v33;
        v7 = &v32;
      }
      else
      {
        CGAffineTransformScale(&v29, &v34, 1.0, -1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v28 = v29;
        v7 = &v28;
      }
    }
  }
  else if ([(NSNumber *)self->_currentRotation isEqualToNumber:&off_6B270])
  {
    memset(&v35, 0, sizeof(v35));
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v8;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v35, &v34, 0.0);
    int v9 = self->_mirrorType;
    if (v9 == 2)
    {
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v25, &v34, 1.0, 1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v24 = v25;
      v7 = &v24;
    }
    else
    {
      if (v9 != 1) {
        return;
      }
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v27, &v34, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v26 = v27;
      v7 = &v26;
    }
  }
  else if ([(NSNumber *)self->_currentRotation isEqualToNumber:&off_6B258])
  {
    memset(&v35, 0, sizeof(v35));
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v10;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v35, &v34, -1.57079633);
    int v11 = self->_mirrorType;
    if (v11 == 2)
    {
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v21, &v34, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v20 = v21;
      v7 = &v20;
    }
    else
    {
      CGAffineTransform v34 = v35;
      if (v11 == 1)
      {
        CGAffineTransformScale(&v23, &v34, 1.0, 1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v22 = v23;
        v7 = &v22;
      }
      else
      {
        CGAffineTransformScale(&v19, &v34, 1.0, -1.0);
        CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
        CFDictionaryRef v6 = v5;
        CGAffineTransform v18 = v19;
        v7 = &v18;
      }
    }
  }
  else
  {
    memset(&v35, 0, sizeof(v35));
    long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v12;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v35, &v34, 0.0);
    int v13 = self->_mirrorType;
    if (v13)
    {
      if (v13 != 2) {
        return;
      }
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v17, &v34, -1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v16 = v17;
      v7 = &v16;
    }
    else
    {
      CGAffineTransform v34 = v35;
      CGAffineTransformScale(&v15, &v34, 1.0, -1.0);
      CFDictionaryRef v5 = [(RPCCUIVideoView *)self layer];
      CFDictionaryRef v6 = v5;
      CGAffineTransform v14 = v15;
      v7 = &v14;
    }
  }
  objc_msgSend(v5, "setAffineTransform:", v7, *(_OWORD *)&v14.a, *(_OWORD *)&v14.c, *(_OWORD *)&v14.tx);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_portType, 0);

  objc_storeStrong((id *)&self->_currentRotation, 0);
}

@end