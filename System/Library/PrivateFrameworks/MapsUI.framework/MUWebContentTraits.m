@interface MUWebContentTraits
- (BOOL)isNativelyDrawingPlatter;
- (BOOL)isVibrant;
- (id)queryItems;
- (void)setNativelyDrawingPlatter:(BOOL)a3;
- (void)setVibrant:(BOOL)a3;
@end

@implementation MUWebContentTraits

- (id)queryItems
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F290C8]);
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[MUWebContentTraits isVibrant](self, "isVibrant"));
  v5 = [v4 stringValue];
  v6 = (void *)[v3 initWithName:@"isVibrant" value:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F290C8]);
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[MUWebContentTraits isNativelyDrawingPlatter](self, "isNativelyDrawingPlatter"));
  v9 = [v8 stringValue];
  v10 = (void *)[v7 initWithName:@"hasPlatter" value:v9];

  v13[0] = v6;
  v13[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  return v11;
}

- (BOOL)isVibrant
{
  return self->_vibrant;
}

- (void)setVibrant:(BOOL)a3
{
  self->_vibrant = a3;
}

- (BOOL)isNativelyDrawingPlatter
{
  return self->_nativelyDrawingPlatter;
}

- (void)setNativelyDrawingPlatter:(BOOL)a3
{
  self->_nativelyDrawingPlatter = a3;
}

@end