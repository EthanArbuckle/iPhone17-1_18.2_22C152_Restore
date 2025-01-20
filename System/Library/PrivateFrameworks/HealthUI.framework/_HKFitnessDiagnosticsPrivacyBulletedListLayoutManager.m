@interface _HKFitnessDiagnosticsPrivacyBulletedListLayoutManager
- (NSAttributedString)bullet;
- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)setBullet:(id)a3;
@end

@implementation _HKFitnessDiagnosticsPrivacyBulletedListLayoutManager

- (void)setBullet:(id)a3
{
  id v4 = a3;
  v5 = (NSAttributedString *)[v4 copy];
  bullet = self->_bullet;
  self->_bullet = v5;

  [v4 size];
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  self->_bulletSize.width = v8;
  self->_bulletSize.height = v10;
  id v11 = [(_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager *)self textStorage];
  -[_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", 0, [v11 length]);
}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v19.receiver = self;
  v19.super_class = (Class)_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager;
  [(_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager *)&v19 drawGlyphsForGlyphRange:a4.x atPoint:a4.y];
  CGFloat v8 = [(_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager *)self bullet];
  if (v8)
  {
    double v9 = [(_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager *)self textStorage];
    CGFloat v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v11 = (void *)MEMORY[0x1E4FB0850];
    v12 = [v10 objectForKey:*MEMORY[0x1E4F1C438]];
    uint64_t v13 = [v11 defaultWritingDirectionForLanguage:v12];

    if (v13 == -1)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"HKFitnessDiagnosticsPrivacyDetailsCell.m" lineNumber:250 description:@"Unexpectedly received unresolved writing direction"];
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __89___HKFitnessDiagnosticsPrivacyBulletedListLayoutManager_drawGlyphsForGlyphRange_atPoint___block_invoke;
    v16[3] = &unk_1E6D52768;
    v16[4] = self;
    id v17 = v9;
    uint64_t v18 = v13;
    id v14 = v9;
    -[_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager enumerateLineFragmentsForGlyphRange:usingBlock:](self, "enumerateLineFragmentsForGlyphRange:usingBlock:", location, length, v16);
  }
}

- (NSAttributedString)bullet
{
  return self->_bullet;
}

- (void).cxx_destruct
{
}

@end