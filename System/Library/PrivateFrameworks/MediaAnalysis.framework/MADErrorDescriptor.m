@interface MADErrorDescriptor
- (MADErrorDescriptor)initWithErrorCode:(unint64_t)a3 count:(unint64_t)a4 errorLine:(unint64_t)a5;
- (int64_t)compareByCount:(id)a3;
- (unint64_t)count;
- (unint64_t)errorCode;
- (unint64_t)errorLine;
- (void)setCount:(unint64_t)a3;
- (void)setErrorCode:(unint64_t)a3;
- (void)setErrorLine:(unint64_t)a3;
@end

@implementation MADErrorDescriptor

- (MADErrorDescriptor)initWithErrorCode:(unint64_t)a3 count:(unint64_t)a4 errorLine:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MADErrorDescriptor;
  result = [(MADErrorDescriptor *)&v9 init];
  if (result)
  {
    result->_errorCode = a3;
    result->_count = a4;
    result->_errorLine = a5;
  }
  return result;
}

- (int64_t)compareByCount:(id)a3
{
  id v4 = a3;
  unint64_t count = self->_count;
  if (count < (unint64_t)[v4 count]) {
    goto LABEL_5;
  }
  unint64_t v6 = self->_count;
  if (v6 > (unint64_t)[v4 count])
  {
    int64_t v7 = -1;
    goto LABEL_6;
  }
  unint64_t errorCode = self->_errorCode;
  if (errorCode < (unint64_t)[v4 errorCode])
  {
LABEL_5:
    int64_t v7 = 1;
    goto LABEL_6;
  }
  unint64_t v10 = self->_errorCode;
  if (v10 <= (unint64_t)[v4 errorCode]) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
LABEL_6:

  return v7;
}

- (unint64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(unint64_t)a3
{
  self->_unint64_t errorCode = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_unint64_t count = a3;
}

- (unint64_t)errorLine
{
  return self->_errorLine;
}

- (void)setErrorLine:(unint64_t)a3
{
  self->_errorLine = a3;
}

@end