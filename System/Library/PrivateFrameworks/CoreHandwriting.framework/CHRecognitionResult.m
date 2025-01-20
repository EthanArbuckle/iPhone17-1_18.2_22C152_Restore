@interface CHRecognitionResult
- (CHRecognitionResult)initWithScore:(double)a3;
- (double)score;
- (id)description;
- (void)setScore:(double)a3;
@end

@implementation CHRecognitionResult

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_msgSend_score(self, v5, v6, v7, v8, v9);
  uint64_t v11 = v10;
  v17 = objc_msgSend_string(self, v12, v13, v14, v15, v16);
  v22 = objc_msgSend_stringWithFormat_(v3, v18, @"class: %@ score: %3.5f string: %@", v19, v20, v21, v4, v11, v17);

  return v22;
}

- (CHRecognitionResult)initWithScore:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHRecognitionResult;
  result = [(CHRecognitionResult *)&v5 init];
  if (result) {
    result->_score = a3;
  }
  return result;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

@end