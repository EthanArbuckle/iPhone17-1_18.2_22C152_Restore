@interface _CLKPlayerView
+ (Class)layerClass;
@end

@implementation _CLKPlayerView

+ (Class)layerClass
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getAVPlayerLayerClass_softClass;
  uint64_t v10 = getAVPlayerLayerClass_softClass;
  if (!getAVPlayerLayerClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getAVPlayerLayerClass_block_invoke;
    v6[3] = &unk_26440E380;
    v6[4] = &v7;
    __getAVPlayerLayerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  v4 = objc_opt_class();

  return (Class)v4;
}

@end