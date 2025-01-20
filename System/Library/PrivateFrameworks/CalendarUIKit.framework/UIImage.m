@interface UIImage
- (void)cuik_drawAtPoint:(double)a3;
@end

@implementation UIImage

uint64_t __59__UIImage_CUIKPlatforms__cuik_drawImageWithSize_drawBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 CGContext];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (void)cuik_drawAtPoint:(double)a3
{
  if (a1) {
    return objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 0, a3, a4, 1.0);
  }
  return a1;
}

void *__47__UIImage_CUIKPlatforms__cuik_imageWithInsets___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return objc_msgSend(result, "drawAtPoint:blendMode:alpha:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), 1.0);
  }
  return result;
}

@end