@interface CSIHelper
- (void)dealloc;
@end

@implementation CSIHelper

- (void)dealloc
{
  objc_storeWeak((id *)&self->rendition, 0);
  objc_storeWeak((id *)&self->sharedBlockDataBGRX, 0);
  objc_storeWeak((id *)&self->sharedBlockDataRGBX, 0);
  objc_storeWeak((id *)&self->sharedBlockDataGray, 0);
  v3.receiver = self;
  v3.super_class = (Class)CSIHelper;
  [(CSIHelper *)&v3 dealloc];
}

@end