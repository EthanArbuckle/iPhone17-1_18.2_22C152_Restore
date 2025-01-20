@interface CTKNamedEntity
- (CTKNamedEntity)initWithName:(id)a3 firstOccurrence:(unint64_t)a4 tagType:(id)a5;
- (NSString)name;
- (NSString)tag;
- (float)score;
- (unint64_t)count;
- (unint64_t)firstOccurrence;
- (void)incOccurenceWithPosition:(unint64_t)a3;
- (void)setCount:(unint64_t)a3;
- (void)setScore:(float)a3;
@end

@implementation CTKNamedEntity

- (CTKNamedEntity)initWithName:(id)a3 firstOccurrence:(unint64_t)a4 tagType:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CTKNamedEntity;
  v11 = [(CTKNamedEntity *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    objc_storeStrong((id *)&v12->_tag, a5);
    v12->_firstOccurrence = a4;
    v12->_count = 1;
    float v13 = pow((double)(a4 + 1), -0.1);
    v12->_score = v13;
  }

  return v12;
}

- (void)incOccurenceWithPosition:(unint64_t)a3
{
  [(CTKNamedEntity *)self setCount:(char *)[(CTKNamedEntity *)self count] + 1];
  double v5 = pow((double)(a3 + 1), -0.1);
  [(CTKNamedEntity *)self score];
  double v7 = v5 + v6;
  *(float *)&double v7 = v7;
  [(CTKNamedEntity *)self setScore:v7];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)tag
{
  return self->_tag;
}

- (unint64_t)firstOccurrence
{
  return self->_firstOccurrence;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end