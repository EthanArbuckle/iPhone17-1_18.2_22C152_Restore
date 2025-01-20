@interface CKBalloonSelectionState
+ (id)balloonSelectionState:(int64_t)a3;
+ (id)balloonSelectionState:(int64_t)a3 textSelectionRange:(_NSRange)a4;
- (CKBalloonSelectionState)initWithStyle:(int64_t)a3 textSelectionRange:(_NSRange)a4;
- (_NSRange)textSelectionRange;
- (id)description;
- (int64_t)style;
@end

@implementation CKBalloonSelectionState

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CKBalloonSelectionState;
  v4 = [(CKBalloonSelectionState *)&v9 description];
  int64_t style = self->_style;
  v6 = NSStringFromRange(self->_textSelectionRange);
  v7 = [v3 stringWithFormat:@"%@: style: %ld, selection range: %@", v4, style, v6];

  return v7;
}

- (CKBalloonSelectionState)initWithStyle:(int64_t)a3 textSelectionRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v8.receiver = self;
  v8.super_class = (Class)CKBalloonSelectionState;
  result = [(CKBalloonSelectionState *)&v8 init];
  if (result)
  {
    result->_int64_t style = a3;
    result->_textSelectionRange.NSUInteger location = location;
    result->_textSelectionRange.NSUInteger length = length;
  }
  return result;
}

+ (id)balloonSelectionState:(int64_t)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithStyle:textSelectionRange:", a3, 0, 0);

  return v3;
}

+ (id)balloonSelectionState:(int64_t)a3 textSelectionRange:(_NSRange)a4
{
  v4 = objc_msgSend(objc_alloc((Class)a1), "initWithStyle:textSelectionRange:", a3, a4.location, a4.length);

  return v4;
}

- (int64_t)style
{
  return self->_style;
}

- (_NSRange)textSelectionRange
{
  NSUInteger length = self->_textSelectionRange.length;
  NSUInteger location = self->_textSelectionRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end