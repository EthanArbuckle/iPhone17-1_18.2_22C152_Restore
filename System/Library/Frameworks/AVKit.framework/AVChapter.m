@interface AVChapter
+ (id)chapterAtTime:(double)a3 inChapters:(id)a4;
+ (id)playbackChapterWithStartTime:(double)a3 duration:(double)a4 number:(unint64_t)a5 title:(id)a6 imageFaultBlock:(id)a7;
+ (void)initialize;
- (AVChapter)initWithStartTime:(double)a3 duration:(double)a4 number:(unint64_t)a5 title:(id)a6 imageFaultBlock:(id)a7;
- (BOOL)isEqual:(id)a3;
- (CGImage)cgImage;
- (NSString)title;
- (UIImage)image;
- (double)duration;
- (double)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (unint64_t)number;
- (void)dealloc;
- (void)setCGImage:(CGImage *)a3;
- (void)setCgImage:(CGImage *)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation AVChapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_imageBlock, 0);
}

- (void)setCgImage:(CGImage *)a3
{
  self->_cgImage = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)number
{
  return self->_number;
}

- (double)duration
{
  return self->_duration;
}

- (double)startTime
{
  return self->_startTime;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"cgImage"])
  {
    uint64_t v5 = [(AVChapter *)self cgImage];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVChapter;
    uint64_t v5 = [(AVChapter *)&v8 valueForUndefinedKey:v4];
  }
  v6 = (void *)v5;

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 isEqualToString:@"cgImage"])
  {
    [(AVChapter *)self setCGImage:v7];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVChapter;
    [(AVChapter *)&v8 setValue:v7 forUndefinedKey:v6];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AVChapter *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(AVChapter *)self startTime], double v6 = v5, [(AVChapter *)v4 startTime], v6 == v7)
      && ([(AVChapter *)self duration], double v9 = v8, [(AVChapter *)v4 duration], v9 == v10)
      && (unint64_t v11 = [(AVChapter *)self number], v11 == [(AVChapter *)v4 number]))
    {
      v12 = [(AVChapter *)self title];
      v13 = [(AVChapter *)v4 title];
      if ([v12 isEqualToString:v13])
      {
        v14 = [(AVChapter *)self cgImage];
        BOOL v15 = v14 == [(AVChapter *)v4 cgImage];
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  v2 = [(AVChapter *)self title];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  [(AVChapter *)self startTime];
  double v6 = v5;
  [(AVChapter *)self duration];
  double v8 = v7;
  unint64_t v9 = [(AVChapter *)self number];
  double v10 = [(AVChapter *)self title];
  unint64_t v11 = (void *)[self->_imageBlock copy];
  v12 = (void *)[v4 initWithStartTime:v9 duration:v10 number:v11 title:v6 imageFaultBlock:v8];

  return v12;
}

- (void)setCGImage:(CGImage *)a3
{
  cgImage = self->_cgImage;
  if (cgImage != a3)
  {
    if (cgImage) {
      CGImageRelease(cgImage);
    }
    self->_cgImage = a3;
    if (a3)
    {
      CGImageRetain(a3);
    }
  }
}

- (CGImage)cgImage
{
  return self->_cgImage;
}

- (void)dealloc
{
  [(AVChapter *)self setCGImage:0];
  v3.receiver = self;
  v3.super_class = (Class)AVChapter;
  [(AVChapter *)&v3 dealloc];
}

- (AVChapter)initWithStartTime:(double)a3 duration:(double)a4 number:(unint64_t)a5 title:(id)a6 imageFaultBlock:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)AVChapter;
  BOOL v15 = [(AVChapter *)&v24 init];
  v16 = v15;
  if (v15)
  {
    v15->_startTime = a3;
    v15->_duration = a4;
    v15->_number = a5;
    objc_storeStrong((id *)&v15->_title, a6);
    uint64_t v17 = MEMORY[0x1B3E963E0](v14);
    id imageBlock = v16->_imageBlock;
    v16->_id imageBlock = (id)v17;

    if (v16->_imageBlock)
    {
      objc_initWeak(&location, v16);
      v19 = _imageQueue;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __69__AVChapter_initWithStartTime_duration_number_title_imageFaultBlock___block_invoke;
      v21[3] = &unk_1E5FC44F8;
      objc_copyWeak(&v22, &location);
      dispatch_async(v19, v21);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }

  return v16;
}

void __69__AVChapter_initWithStartTime_duration_number_title_imageFaultBlock___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = (*(uint64_t (**)(void))(WeakRetained[1] + 16))();
    if (v3)
    {
      id v4 = (void *)v3;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __69__AVChapter_initWithStartTime_duration_number_title_imageFaultBlock___block_invoke_2;
      v5[3] = &unk_1E5FC41D0;
      objc_copyWeak(v6, v1);
      v6[1] = v4;
      dispatch_async(MEMORY[0x1E4F14428], v5);
      objc_destroyWeak(v6);
    }
  }
}

void __69__AVChapter_initWithStartTime_duration_number_title_imageFaultBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCGImage:*(void *)(a1 + 40)];

  uint64_t v3 = *(CGImage **)(a1 + 40);

  CGImageRelease(v3);
}

+ (id)chapterAtTime:(double)a3 inChapters:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v9 + v8;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v11), "startTime", (void)v17);
          if (v13 > a3)
          {
            uint64_t v12 = v9 + v11;
            goto LABEL_14;
          }
          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v9 = v12;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
LABEL_14:

    id v14 = 0;
    if (v12) {
      uint64_t v15 = v12 - 1;
    }
    else {
      uint64_t v15 = 0;
    }
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = objc_msgSend(v6, "objectAtIndexedSubscript:");
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)playbackChapterWithStartTime:(double)a3 duration:(double)a4 number:(unint64_t)a5 title:(id)a6 imageFaultBlock:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = (void *)[objc_alloc((Class)a1) initWithStartTime:a5 duration:v13 number:v12 title:a3 imageFaultBlock:a4];

  return v14;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.AVKit.ChapterImageQueue", 0);
    uint64_t v3 = _imageQueue;
    _imageQueue = (uint64_t)v2;
    MEMORY[0x1F41817F8](v2, v3);
  }
}

- (UIImage)image
{
  dispatch_queue_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1818]), "initWithCGImage:", -[AVChapter cgImage](self, "cgImage"));

  return (UIImage *)v2;
}

@end