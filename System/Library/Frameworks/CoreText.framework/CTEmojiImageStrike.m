@interface CTEmojiImageStrike
- (CGImage)cgImage;
- (CGSize)alignmentInset;
- (CTEmojiImageStrike)initWithImage:(CGImage *)a3 alignmentInset:(CGSize)a4;
- (CTEmojiImageStrike)initWithImage:(CGImage *)a3 alignmentInset:(CGSize)a4 provenanceInfo:(id)a5;
- (CTEmojiImageStrike)initWithImage:(CGImage *)a3 imageProperties:(id)a4;
- (NSDictionary)provenance;
- (void)dealloc;
- (void)setProvenance:(id)a3;
@end

@implementation CTEmojiImageStrike

- (CTEmojiImageStrike)initWithImage:(CGImage *)a3 alignmentInset:(CGSize)a4 provenanceInfo:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CTEmojiImageStrike;
  v10 = [(CTEmojiImageStrike *)&v12 init];
  if (v10)
  {
    v10->_cgImage = CGImageRetain(a3);
    v10->_alignmentInset.CGFloat width = width;
    v10->_alignmentInset.CGFloat height = height;
    [(CTEmojiImageStrike *)v10 setProvenance:v9];
  }

  return v10;
}

- (CTEmojiImageStrike)initWithImage:(CGImage *)a3 imageProperties:(id)a4
{
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v8 = [a4 valueForKey:*MEMORY[0x1E4F2FB80]];
  id v9 = -[CTEmojiImageStrike initWithImage:alignmentInset:provenanceInfo:](self, "initWithImage:alignmentInset:provenanceInfo:", a3, v8, v6, v7);

  return v9;
}

- (CTEmojiImageStrike)initWithImage:(CGImage *)a3 alignmentInset:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v8 = [MEMORY[0x1E4F1C9E8] dictionary];
  id v9 = -[CTEmojiImageStrike initWithImage:alignmentInset:provenanceInfo:](self, "initWithImage:alignmentInset:provenanceInfo:", a3, v8, width, height);

  return v9;
}

- (void)dealloc
{
  CGImageRelease(self->_cgImage);
  v3.receiver = self;
  v3.super_class = (Class)CTEmojiImageStrike;
  [(CTEmojiImageStrike *)&v3 dealloc];
}

- (CGImage)cgImage
{
  return self->_cgImage;
}

- (CGSize)alignmentInset
{
  objc_copyStruct(v4, &self->_alignmentInset, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (NSDictionary)provenance
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProvenance:(id)a3
{
}

- (void).cxx_destruct
{
}

@end