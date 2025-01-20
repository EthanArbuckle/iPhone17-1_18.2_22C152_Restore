@interface PLBatteryUIGraphViewInternal
+ (int)graphHeight;
- (NSMutableArray)inputData;
- (PLBatteryUIGraphViewInternal)initWithFrame:(CGRect)a3;
- (PLBatteryUIGraphViewInternal)initWithFrame:(CGRect)a3 andData:(id)a4;
- (int)graphType;
- (void)drawErrorText:(CGContext *)a3 andRect:(CGRect)a4;
- (void)drawGrid:(CGContext *)a3 andRect:(CGRect)a4;
- (void)drawPoints:(CGContext *)a3 andRect:(CGRect)a4;
- (void)drawRect:(CGRect)a3;
- (void)setDefaultRange;
- (void)setGraphType:(int)a3;
- (void)setInputData:(id)a3;
- (void)setRangesFromArray:(id)a3;
@end

@implementation PLBatteryUIGraphViewInternal

+ (int)graphHeight
{
  return 150;
}

- (void)setDefaultRange
{
  self->minPower = 0.0;
  self->maxPower = 10.0;
  v3 = +[NSDate date];
  endDate = self->endDate;
  self->endDate = v3;

  self->startDate = [(NSDate *)self->endDate dateByAddingTimeInterval:-43200.0];

  _objc_release_x1();
}

- (void)setRangesFromArray:(id)a3
{
  id v4 = a3;
  p_startDate = &self->startDate;
  startDate = self->startDate;
  self->startDate = 0;

  p_endDate = &self->endDate;
  endDate = self->endDate;
  self->endDate = 0;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v32;
    float v13 = -1.0;
    float v14 = -1.0;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", 1, (void)v31);
        [v17 floatValue];
        float v19 = v18;

        v20 = [v16 objectAtIndexedSubscript:0];
        if (v14 == -1.0) {
          float v14 = v19;
        }
        if (v13 == -1.0) {
          float v13 = v19;
        }
        if (!*p_startDate) {
          objc_storeStrong((id *)&self->startDate, v20);
        }
        if (!*p_endDate) {
          objc_storeStrong((id *)&self->endDate, v20);
        }
        if (v19 > v13) {
          *(float *)&double v21 = v19;
        }
        else {
          *(float *)&double v21 = v13;
        }
        if (v19 < v14) {
          float v14 = v19;
        }
        else {
          float v13 = *(float *)&v21;
        }
        objc_msgSend(v20, "timeIntervalSinceDate:", *p_startDate, v21);
        v22 = &self->startDate;
        if (v23 < 0.0 || ([v20 timeIntervalSinceDate:*p_endDate], v22 = &self->endDate, v24 > 0.0)) {
          objc_storeStrong((id *)v22, v20);
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }
  else
  {
    float v13 = -1.0;
    float v14 = -1.0;
  }

  float v25 = (float)(v13 - v14) * 0.125;
  self->minPower = v14 - v25;
  self->maxPower = v13 + v25;
  if (v14 >= 0.0)
  {
    if (self->minPower < 0.0) {
      self->minPower = 0.0;
    }
    if (v25 == 0.0)
    {
      self->maxPower = v13 + v13;
      self->minPower = 0.0;
    }
    if (self->maxPower == 0.0)
    {
      self->maxPower = 10.0;
      self->minPower = 0.0;
    }
    -[NSDate timeIntervalSinceDate:](*p_endDate, "timeIntervalSinceDate:", *p_startDate, (void)v31);
    if (v26 == 0.0)
    {
      uint64_t v27 = +[NSDate dateWithTimeInterval:*p_startDate sinceDate:-3600.0];
      v28 = *p_startDate;
      *p_startDate = (NSDate *)v27;

      uint64_t v29 = +[NSDate dateWithTimeInterval:*p_endDate sinceDate:3600.0];
      v30 = *p_endDate;
      *p_endDate = (NSDate *)v29;
    }
  }
  else
  {
    self->_errValue = 1;
  }
}

- (void)setInputData:(id)a3
{
  self->_errValue = 0;
  id v4 = (NSMutableArray *)[a3 mutableCopy];
  inputData = self->_inputData;
  self->_inputData = v4;

  v6 = self->_inputData;
  if (v6 && (unint64_t)[(NSMutableArray *)v6 count] > 1)
  {
    [(NSMutableArray *)self->_inputData sortUsingComparator:&stru_BE900];
    v7 = self->_inputData;
    [(PLBatteryUIGraphViewInternal *)self setRangesFromArray:v7];
  }
  else
  {
    self->_errValue = 2;
  }
}

- (PLBatteryUIGraphViewInternal)initWithFrame:(CGRect)a3 andData:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLBatteryUIGraphViewInternal;
  id v10 = -[PLBatteryUIGraphViewInternal initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    id v11 = [v9 mutableCopy];
    [(PLBatteryUIGraphViewInternal *)v10 setInputData:v11];
  }
  return v10;
}

- (PLBatteryUIGraphViewInternal)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLBatteryUIGraphViewInternal;
  v3 = -[PLBatteryUIGraphViewInternal initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(PLBatteryUIGraphViewInternal *)v3 setInputData:0];
  }
  return v4;
}

- (void)drawGrid:(CGContext *)a3 andRect:(CGRect)a4
{
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  float v8 = a4.size.width + -20.0;
  float v9 = a4.size.height + -15.0;
  id v10 = +[UIColor lightGrayColor];
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v10 CGColor]);

  v62.size.CGFloat width = v8;
  v62.origin.double x = 20.0;
  v62.origin.double y = 0.0;
  v62.size.double height = v9;
  CGContextFillRect(a3, v62);
  id v11 = +[UIFont systemFontOfSize:10.0];
  id v12 = objc_alloc_init((Class)NSDateFormatter);
  [(NSDate *)self->endDate timeIntervalSinceDate:self->startDate];
  float v14 = v13;
  if (v14 <= 7200.0) {
    CFStringRef v15 = @"HH:mm";
  }
  else {
    CFStringRef v15 = @"HH";
  }
  [v12 setDateFormat:v15];
  CGContextSetLineWidth(a3, 0.6);
  id v16 = +[UIColor grayColor];
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v16 CGColor]);

  *(_OWORD *)lengths = xmmword_9B530;
  CGContextSetLineDash(a3, 0.0, lengths, 2uLL);
  int v17 = (int)(float)(v8 * 0.125);
  int v18 = (int)(float)(v9 / 10.0);
  int v19 = v18;
  float v50 = self->maxPower - self->minPower;
  int v20 = 9;
  int v21 = 20;
  do
  {
    CGContextMoveToPoint(a3, (double)v21, 0.0);
    CGContextAddLineToPoint(a3, (double)v21, v9);
    v21 += v17;
    --v20;
  }
  while (v20);
  v51 = v12;
  v22 = self;
  float v23 = v14 * 0.125;
  int v24 = 11;
  do
  {
    CGContextMoveToPoint(a3, 20.0, (float)(v9 - (float)v20));
    CGContextAddLineToPoint(a3, width, (float)(v9 - (float)v20));
    v20 += v18;
    --v24;
  }
  while (v24);
  CGContextStrokePath(a3);
  CGContextSetLineDash(a3, 0.0, 0, 0);
  float v25 = 0;
  int v52 = 2 * v17;
  int v26 = -2;
  int v27 = 20;
  do
  {
    v28 = v25;
    v26 += 2;
    uint64_t v29 = +[NSDate dateWithTimeInterval:v22->startDate sinceDate:(float)(v23 * (float)v26)];
    float v25 = [v51 stringFromDate:v29];

    NSAttributedStringKey v59 = NSFontAttributeName;
    v60 = v11;
    v30 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    [v25 sizeWithAttributes:v30];
    double v32 = v31;
    double v34 = v33;

    float v35 = (double)v27 + v32 * -0.5;
    float v36 = height - v34;
    double v37 = v35;
    double v38 = v36;
    NSAttributedStringKey v57 = NSFontAttributeName;
    v58 = v11;
    v39 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    objc_msgSend(v25, "drawInRect:withAttributes:", v39, v37, v38, v32, v34);

    v27 += v52;
  }
  while (v26 < 7);
  for (int i = 1; i != 10; ++i)
  {
    v41 = v25;
    float v25 = +[NSString stringWithFormat:@"%d", (int)(float)(v22->minPower + (float)((float)i * (float)(v50 / 10.0)))];

    NSAttributedStringKey v55 = NSFontAttributeName;
    v56 = v11;
    v42 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    [v25 sizeWithAttributes:v42];
    double v44 = v43;
    double v46 = v45;

    float v47 = (float)(v9 - (float)v19) + v46 * -0.5;
    double v48 = v47;
    NSAttributedStringKey v53 = NSFontAttributeName;
    v54 = v11;
    v49 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    objc_msgSend(v25, "drawInRect:withAttributes:", v49, 0.0, v48, v44, v46);

    v19 += v18;
  }
}

- (void)drawErrorText:(CGContext *)a3 andRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  int errValue = self->_errValue;
  CFStringRef v7 = @"Not Enough Data Points";
  if (errValue != 2) {
    CFStringRef v7 = 0;
  }
  if (errValue == 1) {
    float v8 = @"Negative Power Value";
  }
  else {
    float v8 = (__CFString *)v7;
  }
  float v9 = v8;
  id v10 = +[UIFont systemFontOfSize:10.0];
  NSAttributedStringKey v19 = NSFontAttributeName;
  int v20 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [(__CFString *)v9 sizeWithAttributes:v11];
  double v13 = v12;
  double v15 = v14;

  NSAttributedStringKey v17 = NSFontAttributeName;
  int v18 = v10;
  id v16 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  -[__CFString drawInRect:withAttributes:](v9, "drawInRect:withAttributes:", v16, (width - v13) * 0.5, (height - v15) * 0.5, v13, v15);
}

- (void)drawPoints:(CGContext *)a3 andRect:(CGRect)a4
{
  if (self->_inputData)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    CGContextSetLineWidth(a3, 2.0);
    id v8 = +[UIColor blueColor];
    CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v8 CGColor]);

    float maxPower = self->maxPower;
    float minPower = self->minPower;
    [(NSDate *)self->endDate timeIntervalSinceDate:self->startDate];
    double v12 = v11;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = [(PLBatteryUIGraphViewInternal *)self inputData];
    id v13 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v13)
    {
      id v14 = v13;
      char v15 = 0;
      double v16 = height + -15.0;
      float v17 = v16 / (float)((float)(maxPower - minPower) + 1.0);
      float v18 = (width + -20.0) / v12;
      uint64_t v19 = *(void *)v38;
      double v20 = v18;
      float v21 = 0.0;
      do
      {
        v22 = 0;
        float v23 = v21;
        do
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(obj);
          }
          int v24 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v22);
          float v25 = [v24 objectAtIndexedSubscript:1];
          [v25 floatValue];
          float v27 = v26;

          v28 = [v24 objectAtIndexedSubscript:0];
          float v29 = (float)(v27 - self->minPower) * v17;
          [v28 timeIntervalSinceDate:self->startDate];
          *(float *)&double v30 = v30 * v20;
          float v31 = v16 - v29;
          float v21 = *(float *)&v30 + 20.0;
          if (v15)
          {
            unsigned int v32 = [(PLBatteryUIGraphViewInternal *)self graphType];
            *(float *)&double v33 = v23;
            *(float *)&double v34 = v31;
            if (v32 == 2
              || (unsigned int v35 = [(PLBatteryUIGraphViewInternal *)self graphType],
                  *(float *)&double v33 = v21,
                  *(float *)&double v34 = v23,
                  v35 == 1))
            {
              CGContextAddLineToPoint(a3, *(float *)&v33, *(float *)&v34);
            }
            CGContextAddLineToPoint(a3, v21, v31);
          }
          else
          {
            CGContextMoveToPoint(a3, v21, v31);
          }
          if ([(PLBatteryUIGraphViewInternal *)self graphType] != 2)
          {
            if ([(PLBatteryUIGraphViewInternal *)self graphType] == 1) {
              float v21 = v31;
            }
            else {
              float v21 = v23;
            }
          }

          v22 = (char *)v22 + 1;
          char v15 = 1;
          float v23 = v21;
        }
        while (v14 != v22);
        id v14 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v14);
    }

    CGContextStrokePath(a3);
  }
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  id v9 = +[UIColor whiteColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v9 CGColor]);

  [(PLBatteryUIGraphViewInternal *)self bounds];
  CGContextFillRect(CurrentContext, v11);
  if (self->_errValue)
  {
    [(PLBatteryUIGraphViewInternal *)self setDefaultRange];
    -[PLBatteryUIGraphViewInternal drawGrid:andRect:](self, "drawGrid:andRect:", CurrentContext, x, y, width, height);
    -[PLBatteryUIGraphViewInternal drawErrorText:andRect:](self, "drawErrorText:andRect:", CurrentContext, x, y, width, height);
  }
  else
  {
    -[PLBatteryUIGraphViewInternal drawGrid:andRect:](self, "drawGrid:andRect:", CurrentContext, x, y, width, height);
    -[PLBatteryUIGraphViewInternal drawPoints:andRect:](self, "drawPoints:andRect:", CurrentContext, x, y, width, height);
  }
}

- (NSMutableArray)inputData
{
  return self->_inputData;
}

- (int)graphType
{
  return self->_graphType;
}

- (void)setGraphType:(int)a3
{
  self->_graphType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->endDate, 0);

  objc_storeStrong((id *)&self->startDate, 0);
}

@end