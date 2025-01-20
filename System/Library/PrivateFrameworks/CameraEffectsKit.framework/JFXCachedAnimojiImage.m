@interface JFXCachedAnimojiImage
- ($70930193D4F448A53BB9343C0237EB5F)mediaTimeRange;
- (JFXCachedAnimojiImage)initWithMediaTimeRange:(id *)a3 animojiRenderingAttributes:(id)a4 animojiImageBuffer:(id)a5;
- (NSDictionary)animojiRenderAttributes;
- (PVImageBuffer)animojiImageBuffer;
- (id)description;
@end

@implementation JFXCachedAnimojiImage

- (JFXCachedAnimojiImage)initWithMediaTimeRange:(id *)a3 animojiRenderingAttributes:(id)a4 animojiImageBuffer:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)JFXCachedAnimojiImage;
  v11 = [(JFXCachedAnimojiImage *)&v16 init];
  v12 = (JFXCachedAnimojiImage *)v11;
  if (v11)
  {
    long long v13 = *(_OWORD *)&a3->var0.var0;
    long long v14 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v11 + 56) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v11 + 40) = v14;
    *(_OWORD *)(v11 + 24) = v13;
    objc_storeStrong((id *)v11 + 2, a4);
    objc_storeStrong((id *)&v12->_animojiImageBuffer, a5);
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = [(JFXCachedAnimojiImage *)self animojiImageBuffer];
  [(JFXCachedAnimojiImage *)self mediaTimeRange];
  CMTime time = v15;
  Float64 Seconds = CMTimeGetSeconds(&time);
  [(JFXCachedAnimojiImage *)self mediaTimeRange];
  CMTimeRangeGetEnd(&v14, &range);
  Float64 v6 = CMTimeGetSeconds(&v14);
  v7 = [(JFXCachedAnimojiImage *)self animojiRenderAttributes];
  v8 = [v3 stringWithFormat:@"imageBuffer %@ mediaRange %f:%f animojiRenderingAttributes %@", v4, *(void *)&Seconds, *(void *)&v6, v7];

  v12.receiver = self;
  v12.super_class = (Class)JFXCachedAnimojiImage;
  id v9 = [(JFXCachedAnimojiImage *)&v12 description];
  id v10 = [v9 stringByAppendingString:v8];

  return v10;
}

- (PVImageBuffer)animojiImageBuffer
{
  return self->_animojiImageBuffer;
}

- (NSDictionary)animojiRenderAttributes
{
  return self->_animojiRenderAttributes;
}

- ($70930193D4F448A53BB9343C0237EB5F)mediaTimeRange
{
  long long v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojiRenderAttributes, 0);
  objc_storeStrong((id *)&self->_animojiImageBuffer, 0);
}

@end