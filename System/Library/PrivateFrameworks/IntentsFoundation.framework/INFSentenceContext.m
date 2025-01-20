@interface INFSentenceContext
+ (id)sentenceContext;
- (NSNumber)number;
- (id)combinedWithContext:(id)a3;
- (unint64_t)gender;
- (void)setGender:(unint64_t)a3;
- (void)setNumber:(id)a3;
@end

@implementation INFSentenceContext

- (void).cxx_destruct
{
}

- (void)setGender:(unint64_t)a3
{
  self->_gender = a3;
}

- (unint64_t)gender
{
  return self->_gender;
}

- (void)setNumber:(id)a3
{
}

- (NSNumber)number
{
  return self->_number;
}

- (id)combinedWithContext:(id)a3
{
  id v4 = a3;
  v5 = +[INFSentenceContext sentenceContext];
  [v5 setNumber:self->_number];
  [v5 setGender:self->_gender];
  v6 = [v4 number];

  if (v6)
  {
    v7 = [v4 number];
    [v5 setNumber:v7];
  }
  if ([v4 gender]) {
    objc_msgSend(v5, "setGender:", objc_msgSend(v4, "gender"));
  }

  return v5;
}

+ (id)sentenceContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end