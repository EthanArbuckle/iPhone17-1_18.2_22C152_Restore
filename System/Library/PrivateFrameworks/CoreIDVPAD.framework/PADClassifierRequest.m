@interface PADClassifierRequest
- (NSArray)gestureTypes;
- (NSArray)gestures;
- (unint64_t)minNumberOfGestures;
- (void)setGestureTypes:(id)a3;
- (void)setGestures:(id)a3;
- (void)setMinNumberOfGestures:(unint64_t)a3;
@end

@implementation PADClassifierRequest

- (NSArray)gestures
{
  return self->_gestures;
}

- (void)setGestures:(id)a3
{
}

- (NSArray)gestureTypes
{
  return self->_gestureTypes;
}

- (void)setGestureTypes:(id)a3
{
}

- (unint64_t)minNumberOfGestures
{
  return self->_minNumberOfGestures;
}

- (void)setMinNumberOfGestures:(unint64_t)a3
{
  self->_minNumberOfGestures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureTypes, 0);
  objc_storeStrong((id *)&self->_gestures, 0);
}

@end