@interface BWAutoSuggestTracker
- (BWAutoSuggestTracker)init;
- (CGRect)rect;
- (NSMutableArray)centerDx;
- (NSMutableArray)centerDy;
- (NSMutableArray)centerVx;
- (NSMutableArray)centerVy;
- (NSMutableArray)centersIn;
- (NSMutableArray)objectAreaIn;
- (int)objectType;
- (int)trackerID;
- (int)validObjectCounter;
- (int64_t)combinedTrackerID;
- (unsigned)confidenceLevel;
- (void)dealloc;
- (void)setCenterDx:(id)a3;
- (void)setCenterDy:(id)a3;
- (void)setCenterVx:(id)a3;
- (void)setCenterVy:(id)a3;
- (void)setCentersIn:(id)a3;
- (void)setCombinedTrackerID:(int64_t)a3;
- (void)setConfidenceLevel:(unsigned int)a3;
- (void)setObjectAreaIn:(id)a3;
- (void)setObjectType:(int)a3;
- (void)setRect:(CGRect)a3;
- (void)setTrackerID:(int)a3;
- (void)setValidObjectCounter:(int)a3;
@end

@implementation BWAutoSuggestTracker

- (BWAutoSuggestTracker)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWAutoSuggestTracker;
  v2 = [(BWAutoSuggestTracker *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_objectType = 0;
    v2->_combinedTrackerID = 0;
    v2->_validObjectCounter = 0;
    v2->_rect.origin = 0u;
    v2->_rect.size = 0u;
    v2->_centersIn = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_objectAreaIn = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_centerVx = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_centerVy = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_centerDx = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_centerDy = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWAutoSuggestTracker;
  [(BWAutoSuggestTracker *)&v3 dealloc];
}

- (int)objectType
{
  return self->_objectType;
}

- (void)setObjectType:(int)a3
{
  self->_objectType = a3;
}

- (int)trackerID
{
  return self->_trackerID;
}

- (void)setTrackerID:(int)a3
{
  self->_trackerID = a3;
}

- (int64_t)combinedTrackerID
{
  return self->_combinedTrackerID;
}

- (void)setCombinedTrackerID:(int64_t)a3
{
  self->_combinedTrackerID = a3;
}

- (unsigned)confidenceLevel
{
  return self->_confidenceLevel;
}

- (void)setConfidenceLevel:(unsigned int)a3
{
  self->_confidenceLevel = a3;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (int)validObjectCounter
{
  return self->_validObjectCounter;
}

- (void)setValidObjectCounter:(int)a3
{
  self->_validObjectCounter = a3;
}

- (NSMutableArray)centersIn
{
  return self->_centersIn;
}

- (void)setCentersIn:(id)a3
{
}

- (NSMutableArray)objectAreaIn
{
  return self->_objectAreaIn;
}

- (void)setObjectAreaIn:(id)a3
{
}

- (NSMutableArray)centerVx
{
  return self->_centerVx;
}

- (void)setCenterVx:(id)a3
{
}

- (NSMutableArray)centerVy
{
  return self->_centerVy;
}

- (void)setCenterVy:(id)a3
{
}

- (NSMutableArray)centerDx
{
  return self->_centerDx;
}

- (void)setCenterDx:(id)a3
{
}

- (NSMutableArray)centerDy
{
  return self->_centerDy;
}

- (void)setCenterDy:(id)a3
{
}

@end