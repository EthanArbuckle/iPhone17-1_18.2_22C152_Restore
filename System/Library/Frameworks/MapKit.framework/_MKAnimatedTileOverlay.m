@interface _MKAnimatedTileOverlay
- (BOOL)shouldCrossfade;
- (_MKAnimatedTileOverlay)initWithURLTemplate:(id)a3;
- (double)duration;
- (id)URLForTilePath:(id *)a3 keyframeIndex:(unint64_t)a4;
- (unint64_t)keyframesCount;
- (void)loadTileAtPath:(id *)a3 keyframeIndex:(unint64_t)a4 result:(id)a5;
- (void)setDuration:(double)a3;
- (void)setKeyframesCount:(unint64_t)a3;
- (void)setShouldCrossfade:(BOOL)a3;
@end

@implementation _MKAnimatedTileOverlay

- (_MKAnimatedTileOverlay)initWithURLTemplate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MKAnimatedTileOverlay;
  v3 = [(MKTileOverlay *)&v7 initWithURLTemplate:a3];
  v4 = v3;
  if (v3)
  {
    v3->_keyframesCount = 1;
    v3->_duration = 5.0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)keyframesCount
{
  return self->_keyframesCount;
}

- (void)setKeyframesCount:(unint64_t)a3
{
  self->_keyframesCount = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)shouldCrossfade
{
  return self->_shouldCrossfade;
}

- (void)setShouldCrossfade:(BOOL)a3
{
  self->_shouldCrossfade = a3;
}

- (void).cxx_destruct
{
}

- (id)URLForTilePath:(id *)a3 keyframeIndex:(unint64_t)a4
{
  v6 = [(MKTileOverlay *)self URLTemplate];
  objc_super v7 = (NSMutableString *)[v6 mutableCopy];

  fillTemplate(v7, &cfstr_X.isa, a3->var0);
  fillTemplate(v7, &cfstr_Y.isa, a3->var1);
  fillTemplate(v7, &cfstr_Z.isa, a3->var2);
  double var3 = a3->var3;
  v9 = v7;
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%.0f", *(void *)&var3);
  [(NSMutableString *)v9 replaceOccurrencesOfString:@"{scale}", v10, 0, 0, [(NSMutableString *)v9 length] withString options range];

  v11 = v9;
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a4);
  [(NSMutableString *)v11 replaceOccurrencesOfString:@"{keyframe}", v12, 0, 0, [(NSMutableString *)v11 length] withString options range];

  v13 = [MEMORY[0x1E4F1CB10] URLWithString:v11];

  return v13;
}

- (void)loadTileAtPath:(id *)a3 keyframeIndex:(unint64_t)a4 result:(id)a5
{
  id v8 = a5;
  long long v9 = *(_OWORD *)&a3->var2;
  v19[0] = *(_OWORD *)&a3->var0;
  v19[1] = v9;
  v10 = [(_MKAnimatedTileOverlay *)self URLForTilePath:v19 keyframeIndex:a4];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v10 cachePolicy:1 timeoutInterval:120.0];
  v12 = [MEMORY[0x1E4F290E0] sharedSession];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77___MKAnimatedTileOverlay_CustomLoading__loadTileAtPath_keyframeIndex_result___block_invoke;
  v16[3] = &unk_1E54BEFA0;
  v16[4] = self;
  id v13 = v10;
  id v17 = v13;
  id v14 = v8;
  id v18 = v14;
  v15 = [v12 dataTaskWithRequest:v11 completionHandler:v16];
  [v15 resume];
}

@end