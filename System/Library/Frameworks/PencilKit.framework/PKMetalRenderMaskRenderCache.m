@interface PKMetalRenderMaskRenderCache
- (NSUUID)strokeDataUUID;
- (PKMetalRenderMaskRenderCache)initWithInk:(id)a3 strokeDataUUID:(id)a4;
@end

@implementation PKMetalRenderMaskRenderCache

- (PKMetalRenderMaskRenderCache)initWithInk:(id)a3 strokeDataUUID:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKMetalRenderMaskRenderCache;
  v8 = [(PKMetalStrokeRenderCache *)&v11 initWithInk:a3 renderZoomFactor:1];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_strokeDataUUID, a4);
  }

  return v9;
}

- (NSUUID)strokeDataUUID
{
  return self->_strokeDataUUID;
}

- (void).cxx_destruct
{
}

@end