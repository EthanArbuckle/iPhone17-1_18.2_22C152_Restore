@interface _AFClockTimerIntentSupportMutableProxy
- (NSArray)trackedChanges;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDuration:(double)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation _AFClockTimerIntentSupportMutableProxy

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_AFClockTimerIntentSupportProxy allocWithZone:a3];
  v5 = [(_AFClockTimerIntentSupportProxy *)self timerID];
  unint64_t v6 = [(_AFClockTimerIntentSupportProxy *)self state];
  [(_AFClockTimerIntentSupportProxy *)self duration];
  double v8 = v7;
  [(_AFClockTimerIntentSupportProxy *)self remainingTime];
  double v10 = v9;
  v11 = [(_AFClockTimerIntentSupportProxy *)self lastModifiedDate];
  v12 = [(_AFClockTimerIntentSupportProxy *)self title];
  v13 = [(_AFClockTimerIntentSupportProxy *)self siriContext];
  v14 = [(_AFClockTimerIntentSupportProxy *)v4 initWithTimerID:v5 state:v6 duration:v11 remainingTime:v12 lastModifiedDate:v13 title:v8 siriContext:v10];

  return v14;
}

- (NSArray)trackedChanges
{
  if ([(NSMutableArray *)self->_trackedChanges count]) {
    id v3 = [(NSMutableArray *)self->_trackedChanges copy];
  }
  else {
    id v3 = &__NSArray0__struct;
  }
  return (NSArray *)v3;
}

- (void)setDuration:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_AFClockTimerIntentSupportMutableProxy;
  -[_AFClockTimerIntentSupportProxy setDuration:](&v10, "setDuration:");
  trackedChanges = self->_trackedChanges;
  if (!trackedChanges)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    double v7 = self->_trackedChanges;
    self->_trackedChanges = v6;

    trackedChanges = self->_trackedChanges;
  }
  CFStringRef v11 = @"duration";
  double v8 = +[NSNumber numberWithDouble:a3];
  v12 = v8;
  double v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [(NSMutableArray *)trackedChanges addObject:v9];
}

- (void)setState:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_AFClockTimerIntentSupportMutableProxy;
  -[_AFClockTimerIntentSupportProxy setState:](&v10, "setState:");
  trackedChanges = self->_trackedChanges;
  if (!trackedChanges)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    double v7 = self->_trackedChanges;
    self->_trackedChanges = v6;

    trackedChanges = self->_trackedChanges;
  }
  CFStringRef v11 = @"state";
  double v8 = +[NSNumber numberWithUnsignedInteger:a3];
  v12 = v8;
  double v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [(NSMutableArray *)trackedChanges addObject:v9];
}

@end