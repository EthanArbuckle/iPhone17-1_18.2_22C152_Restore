@interface ImageProcessingXPCServiceModel
- (void)backgroundColorForImageWithData:(id)a3 completion:(id)a4;
- (void)renderThumbnailUsing:(id)a3 completion:(id)a4;
@end

@implementation ImageProcessingXPCServiceModel

- (void)backgroundColorForImageWithData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  swift_retain();
  uint64_t v8 = sub_2439570C0();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_2436FBB24(v8, v10, self, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_2433807F0(v8, v10);

  swift_release();
}

- (void)renderThumbnailUsing:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  swift_retain();
  sub_2436FBCC8((uint64_t)v7, (uint64_t)self, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_release();
}

@end