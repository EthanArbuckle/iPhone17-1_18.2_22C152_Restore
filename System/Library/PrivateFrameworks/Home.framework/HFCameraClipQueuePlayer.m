@interface HFCameraClipQueuePlayer
- (HFCameraClipPlayerItem)currentItem;
- (HFCameraClipQueuePlayer)initWithItems:(id)a3;
- (NSArray)items;
@end

@implementation HFCameraClipQueuePlayer

- (HFCameraClipQueuePlayer)initWithItems:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HFCameraClipQueuePlayer;
  return [(HFCameraClipQueuePlayer *)&v4 initWithItems:a3];
}

- (NSArray)items
{
  v4.receiver = self;
  v4.super_class = (Class)HFCameraClipQueuePlayer;
  v2 = [(HFCameraClipQueuePlayer *)&v4 items];
  return (NSArray *)v2;
}

- (HFCameraClipPlayerItem)currentItem
{
  uint64_t v3 = objc_opt_class();
  v10.receiver = self;
  v10.super_class = (Class)HFCameraClipQueuePlayer;
  id v4 = [(HFCameraClipQueuePlayer *)&v10 currentItem];
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v4;
    if (v5) {
      goto LABEL_8;
    }
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
  }
  v6 = 0;
LABEL_8:

  return (HFCameraClipPlayerItem *)v6;
}

@end