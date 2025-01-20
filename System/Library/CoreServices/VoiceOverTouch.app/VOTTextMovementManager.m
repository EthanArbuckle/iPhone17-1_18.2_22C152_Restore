@interface VOTTextMovementManager
- (NSArray)segments;
- (NSString)localizedSegmentName;
- (NSString)localizedSegmentNameForSelection;
- (VOTTextMovementManager)initWithSegments:(id)a3;
- (id)_localizedStringForKey:(id)a3;
- (int64_t)rotorType;
- (int64_t)segment;
- (unint64_t)segmentIndex;
- (void)nextSegment;
- (void)previousSegment;
- (void)setSegment:(int64_t)a3;
- (void)setSegmentIndex:(unint64_t)a3;
- (void)setSegments:(id)a3;
@end

@implementation VOTTextMovementManager

- (VOTTextMovementManager)initWithSegments:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VOTTextMovementManager;
  v5 = [(VOTTextMovementManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_segmentIndex = 0;
    if ([v4 count])
    {
      v7 = (NSArray *)[v4 copy];
      segments = v6->_segments;
      v6->_segments = v7;
    }
    else
    {
      segments = v6->_segments;
      v6->_segments = (NSArray *)&off_1001C7040;
    }
  }
  return v6;
}

- (int64_t)segment
{
  v3 = [(VOTTextMovementManager *)self segments];
  id v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[VOTTextMovementManager segmentIndex](self, "segmentIndex"));
  id v5 = [v4 integerValue];

  return (int64_t)v5;
}

- (void)setSegment:(int64_t)a3
{
  id v5 = [(VOTTextMovementManager *)self segments];
  v6 = +[NSNumber numberWithInteger:a3];
  id v7 = [v5 indexOfObject:v6];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v8 = 0;
  }
  else {
    id v8 = v7;
  }

  [(VOTTextMovementManager *)self setSegmentIndex:v8];
}

- (NSString)localizedSegmentNameForSelection
{
  unint64_t v3 = (unint64_t)[(VOTTextMovementManager *)self segment] - 1;
  if (v3 > 6) {
    id v4 = 0;
  }
  else {
    id v4 = off_1001B63D0[v3];
  }

  return (NSString *)[(VOTTextMovementManager *)self _localizedStringForKey:v4];
}

- (NSString)localizedSegmentName
{
  unint64_t v3 = (unint64_t)[(VOTTextMovementManager *)self segment] - 1;
  if (v3 > 6) {
    id v4 = 0;
  }
  else {
    id v4 = off_1001B6408[v3];
  }

  return (NSString *)[(VOTTextMovementManager *)self _localizedStringForKey:v4];
}

- (void)nextSegment
{
  unint64_t v3 = [(VOTTextMovementManager *)self segmentIndex] + 1;
  id v4 = [(VOTTextMovementManager *)self segments];
  -[VOTTextMovementManager setSegmentIndex:](self, "setSegmentIndex:", v3 % (unint64_t)[v4 count]);
}

- (void)previousSegment
{
  unint64_t v3 = (char *)[(VOTTextMovementManager *)self segmentIndex] - 1;
  if ((uint64_t)v3 < 0)
  {
    id v4 = [(VOTTextMovementManager *)self segments];
    -[VOTTextMovementManager setSegmentIndex:](self, "setSegmentIndex:", (char *)[v4 count] - 1);
  }
  else
  {
    [(VOTTextMovementManager *)self setSegmentIndex:v3];
  }
}

- (id)_localizedStringForKey:(id)a3
{
  unint64_t v3 = (void *)VOTSharedWorkspace;
  id v4 = a3;
  id v5 = [v3 selectedLanguage];
  v6 = sub_100051804(off_1001EA9E8, v4, v5);

  return v6;
}

- (int64_t)rotorType
{
  return self->_rotorType;
}

- (unint64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (void)setSegmentIndex:(unint64_t)a3
{
  self->_segmentIndex = a3;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end