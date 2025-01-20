@interface CIPassThroughWarpFilter
- (id)outputImage;
@end

@implementation CIPassThroughWarpFilter

- (id)outputImage
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2E80;
  block[3] = &unk_4158;
  block[4] = self;
  if (qword_88E0 != -1) {
    dispatch_once(&qword_88E0, block);
  }
  v3 = (void *)qword_88E8;
  [(CIImage *)self->super.inputImage extent];
  v4 = objc_msgSend(v3, "applyWithExtent:roiCallback:inputImage:arguments:", &stru_4198, self->super.inputImage, &__NSArray0__struct);

  return v4;
}

@end