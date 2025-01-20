@interface NTKExtragalacticDigitDrawInfo
+ (id)drawInfoWithUnifiedSize:(CGSize)a3 paths:(id)a4;
- (CGSize)unifiedGlyphSize;
- (NSDictionary)paths;
- (NTKExtragalacticDigitDrawInfo)initWithUnifiedSize:(CGSize)a3 paths:(id)a4;
- (void)setPaths:(id)a3;
- (void)setUnifiedGlyphSize:(CGSize)a3;
@end

@implementation NTKExtragalacticDigitDrawInfo

+ (id)drawInfoWithUnifiedSize:(CGSize)a3 paths:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  v7 = -[NTKExtragalacticDigitDrawInfo initWithUnifiedSize:paths:]([NTKExtragalacticDigitDrawInfo alloc], "initWithUnifiedSize:paths:", v6, width, height);

  return v7;
}

- (NTKExtragalacticDigitDrawInfo)initWithUnifiedSize:(CGSize)a3 paths:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKExtragalacticDigitDrawInfo;
  v9 = [(NTKExtragalacticDigitDrawInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_unifiedGlyphSize.CGFloat width = width;
    v9->_unifiedGlyphSize.CGFloat height = height;
    objc_storeStrong((id *)&v9->_paths, a4);
  }

  return v10;
}

- (CGSize)unifiedGlyphSize
{
  double width = self->_unifiedGlyphSize.width;
  double height = self->_unifiedGlyphSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setUnifiedGlyphSize:(CGSize)a3
{
  self->_unifiedGlyphSize = a3;
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end