@interface PLBatteryUIMoveableGraphView
+ (int)graphHeight;
- (CGSize)displaySize;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSMutableArray)inputData;
- (PLBatteryUIMoveableGraphView)init;
- (PLBatteryUIMoveableGraphView)initWithFrame:(CGRect)a3;
- (UIColor)graphBackgroundColor;
- (UIColor)gridColor;
- (UIColor)labelColor;
- (UIColor)lineColor;
- (double)MaxDataRange;
- (double)displayRange;
- (double)setGridRange:(double)a3;
- (id)DateChangeArray;
- (int)graphType;
- (void)drawDayLines:(CGContext *)a3 andRect:(CGRect)a4;
- (void)drawErrorText:(CGContext *)a3 andRect:(CGRect)a4;
- (void)drawFill:(CGContext *)a3 andRect:(CGRect)a4;
- (void)drawGrid:(CGContext *)a3 andRect:(CGRect)a4;
- (void)drawLine:(CGContext *)a3 andRect:(CGRect)a4;
- (void)drawRect:(CGRect)a3;
- (void)initGraphAttributes;
- (void)setDefaultRange;
- (void)setDisplayRange:(double)a3;
- (void)setDisplaySize:(CGSize)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGraphBackgroundColor:(id)a3;
- (void)setGraphType:(int)a3;
- (void)setGridColor:(id)a3;
- (void)setInputData:(id)a3;
- (void)setLabelColor:(id)a3;
- (void)setLineColor:(id)a3;
- (void)setMaxDataRange:(double)a3;
- (void)setRangesFromArray:(id)a3;
@end

@implementation PLBatteryUIMoveableGraphView

+ (int)graphHeight
{
  return 150;
}

- (void)initGraphAttributes
{
  [(PLBatteryUIMoveableGraphView *)self setInputData:0];
  [(PLBatteryUIMoveableGraphView *)self setDefaultRange];
  self->_displayRange = 86400.0;
  __asm { FMOV            V0.2D, #-1.0 }
  self->_displaySize = _Q0;
  self->horizontal_label_offset = 0.0;
  self->vertical_label_offset = 15.0;
  self->_MaxDataRange = -1.0;
  v8 = +[UIColor whiteColor];
  lineColor = self->_lineColor;
  self->_lineColor = v8;

  v10 = +[UIColor grayColor];
  gridColor = self->_gridColor;
  self->_gridColor = v10;

  v12 = +[UIColor grayColor];
  labelColor = self->_labelColor;
  self->_labelColor = v12;

  v14 = +[UIColor blackColor];
  graphBackgroundColor = self->_graphBackgroundColor;
  self->_graphBackgroundColor = v14;

  id v21 = +[UIFont systemFontOfSize:10.0];
  v16 = +[NSMutableDictionary dictionary];
  defaultTextAttributes = self->defaultTextAttributes;
  self->defaultTextAttributes = v16;

  [(NSMutableDictionary *)self->defaultTextAttributes setObject:v21 forKeyedSubscript:NSFontAttributeName];
  v18 = [(PLBatteryUIMoveableGraphView *)self labelColor];
  [(NSMutableDictionary *)self->defaultTextAttributes setObject:v18 forKeyedSubscript:NSForegroundColorAttributeName];

  v19 = +[NSMutableArray array];
  dateChangeArray = self->_dateChangeArray;
  self->_dateChangeArray = v19;
}

- (void)setLabelColor:(id)a3
{
  v4 = (UIColor *)[a3 copy];
  labelColor = self->_labelColor;
  self->_labelColor = v4;

  v6 = self->_labelColor;
  defaultTextAttributes = self->defaultTextAttributes;

  [(NSMutableDictionary *)defaultTextAttributes setObject:v6 forKeyedSubscript:NSForegroundColorAttributeName];
}

- (PLBatteryUIMoveableGraphView)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLBatteryUIMoveableGraphView;
  v2 = [(PLBatteryUIMoveableGraphView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PLBatteryUIMoveableGraphView *)v2 initGraphAttributes];
  }
  return v3;
}

- (PLBatteryUIMoveableGraphView)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)PLBatteryUIMoveableGraphView;
  objc_super v5 = -[PLBatteryUIMoveableGraphView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    [(PLBatteryUIMoveableGraphView *)v5 initGraphAttributes];
    v6->_displaySize.CGFloat width = width;
    v6->_displaySize.CGFloat height = height;
  }
  return v6;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v7.receiver = self;
  v7.super_class = (Class)PLBatteryUIMoveableGraphView;
  -[PLBatteryUIMoveableGraphView setFrame:](&v7, "setFrame:", a3.origin.x, a3.origin.y);
  [(PLBatteryUIMoveableGraphView *)self displaySize];
  if (v6 == -1.0) {
    -[PLBatteryUIMoveableGraphView setDisplaySize:](self, "setDisplaySize:", width, height);
  }
}

- (void)setDefaultRange
{
  self->minPower = 0.0;
  self->maxPower = 100.0;
  v3 = +[NSDate date];
  endDate = self->_endDate;
  self->_endDate = v3;

  self->_startDate = [(NSDate *)self->_endDate dateByAddingTimeInterval:-86400.0];

  _objc_release_x1();
}

- (void)setDisplayRange:(double)a3
{
  double v3 = a3;
  if (a3 >= 3600.0)
  {
    objc_super v5 = [(PLBatteryUIMoveableGraphView *)self endDate];
    double v6 = [(PLBatteryUIMoveableGraphView *)self startDate];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    if (v8 < v3)
    {
      v9 = [(PLBatteryUIMoveableGraphView *)self endDate];
      v10 = [(PLBatteryUIMoveableGraphView *)self startDate];
      [v9 timeIntervalSinceDate:v10];
      double v3 = v11;
    }
    double displayRange = self->_displayRange;
    if (v3 != displayRange)
    {
      float v13 = displayRange / v3;
      [(PLBatteryUIMoveableGraphView *)self frame];
      float v15 = v14 * v13;
      double v16 = v15;
      [(PLBatteryUIMoveableGraphView *)self displaySize];
      if (v17 <= v16)
      {
        [(PLBatteryUIMoveableGraphView *)self frame];
        double v19 = v18;
        [(PLBatteryUIMoveableGraphView *)self frame];
        double v21 = v20;
        [(PLBatteryUIMoveableGraphView *)self frame];
        -[PLBatteryUIMoveableGraphView setFrame:](self, "setFrame:", v19, v21, v16);
        self->_double displayRange = v3;
        [(PLBatteryUIMoveableGraphView *)self setNeedsDisplay];
      }
    }
  }
}

- (void)setRangesFromArray:(id)a3
{
  id v4 = a3;
  p_startDate = &self->_startDate;
  startDate = self->_startDate;
  self->_startDate = 0;

  p_endDate = &self->_endDate;
  endDate = self->_endDate;
  self->_endDate = 0;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "objectAtIndexedSubscript:", 0, (void)v34);
        if (!*p_startDate) {
          objc_storeStrong((id *)&self->_startDate, v14);
        }
        if (!*p_endDate) {
          objc_storeStrong((id *)&self->_endDate, v14);
        }
        [v14 timeIntervalSinceDate:*p_startDate];
        float v15 = &self->_startDate;
        if (v16 < 0.0 || ([v14 timeIntervalSinceDate:*p_endDate], float v15 = &self->_endDate, v17 > 0.0)) {
          objc_storeStrong((id *)v15, v14);
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v11);
  }

  [(NSDate *)*p_endDate timeIntervalSinceDate:*p_startDate];
  if (v18 == 0.0)
  {
    uint64_t v19 = +[NSDate dateWithTimeInterval:*p_startDate sinceDate:-3600.0];
    double v20 = *p_startDate;
    *p_startDate = (NSDate *)v19;

    uint64_t v21 = +[NSDate dateWithTimeInterval:*p_endDate sinceDate:3600.0];
    v22 = *p_endDate;
    *p_endDate = (NSDate *)v21;
  }
  -[NSDate timeIntervalSinceDate:](*p_endDate, "timeIntervalSinceDate:", *p_startDate, (void)v34);
  double v24 = v23;
  [(PLBatteryUIMoveableGraphView *)self displayRange];
  float v26 = v24 / v25;
  if (v26 <= 1.0)
  {
    [(NSDate *)*p_endDate timeIntervalSinceDate:*p_startDate];
    self->_double displayRange = v33;
  }
  else
  {
    [(PLBatteryUIMoveableGraphView *)self frame];
    double v28 = v27;
    [(PLBatteryUIMoveableGraphView *)self frame];
    double v30 = v29;
    [(PLBatteryUIMoveableGraphView *)self frame];
    double v32 = v31 * v26;
    [(PLBatteryUIMoveableGraphView *)self frame];
    -[PLBatteryUIMoveableGraphView setFrame:](self, "setFrame:", v28, v30, v32);
  }
  [(PLBatteryUIMoveableGraphView *)self setNeedsDisplay];
}

- (void)setInputData:(id)a3
{
  self->_errValue = 0;
  id v4 = (NSMutableArray *)[a3 mutableCopy];
  inputData = self->_inputData;
  self->_inputData = v4;

  double v6 = self->_inputData;
  if (v6 && (unint64_t)[(NSMutableArray *)v6 count] > 1)
  {
    [(NSMutableArray *)self->_inputData sortUsingComparator:&stru_BF818];
    if (self->_MaxDataRange != -1.0)
    {
      double v7 = (NSMutableArray *)[(NSMutableArray *)self->_inputData mutableCopy];
      double v8 = [(NSMutableArray *)self->_inputData lastObject];
      id v9 = [v8 objectAtIndexedSubscript:0];
      id v10 = [v9 dateByAddingTimeInterval:-self->_MaxDataRange];
      if ([(NSMutableArray *)self->_inputData count])
      {
        uint64_t v11 = 0;
        while (1)
        {
          uint64_t v12 = [(NSMutableArray *)self->_inputData objectAtIndexedSubscript:v11];
          float v13 = [v12 objectAtIndexedSubscript:0];
          [v10 timeIntervalSinceDate:v13];
          double v15 = v14;

          if (v15 <= 0.0) {
            break;
          }
          [(NSMutableArray *)v7 removeObjectAtIndex:0];

          if ((unint64_t)[(NSMutableArray *)self->_inputData count] <= ++v11) {
            goto LABEL_11;
          }
        }
      }
LABEL_11:
      double v16 = self->_inputData;
      self->_inputData = v7;
    }
    double v17 = self->_inputData;
    [(PLBatteryUIMoveableGraphView *)self setRangesFromArray:v17];
  }
  else
  {
    self->_errValue = 2;
  }
}

- (double)setGridRange:(double)a3
{
  if (a3 >= 259200.0) {
    return 43200.0;
  }
  if (a3 >= 86400.0) {
    return 14400.0;
  }
  if (a3 >= 57600.0) {
    return 7200.0;
  }
  if (a3 >= 28800.0) {
    return 3600.0;
  }
  if (a3 >= 14400.0) {
    return 1800.0;
  }
  if (a3 >= 7200.0) {
    return 900.0;
  }
  if (a3 >= 3600.0) {
    return 600.0;
  }
  BOOL v3 = a3 < 1800.0;
  double result = 300.0;
  if (v3) {
    return 120.0;
  }
  return result;
}

- (void)drawGrid:(CGContext *)a3 andRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double x = a4.origin.x;
  double y = a4.origin.y;
  id v8 = objc_alloc_init((Class)NSDateFormatter);
  [v8 setDateFormat:@"MM/dd"];
  id v9 = [(PLBatteryUIMoveableGraphView *)self startDate];
  id v10 = [v8 stringFromDate:v9];

  uint64_t v11 = 72;
  v60 = v10;
  [v10 sizeWithAttributes:self->defaultTextAttributes];
  double v13 = v12;
  double v15 = v14;
  self->vertical_label_offset = v14 + v14;
  double v16 = [(PLBatteryUIMoveableGraphView *)self endDate];
  double v17 = [(PLBatteryUIMoveableGraphView *)self startDate];
  [v16 timeIntervalSinceDate:v17];
  double v19 = v18;

  double v63 = width;
  double v64 = height;
  self->rectWidth = width - self->horizontal_label_offset;
  self->double rectHeight = height - self->vertical_label_offset;
  self->double xInterval = self->rectWidth / v19;
  self->yInterval = self->rectHeight / (float)((float)(self->maxPower - self->minPower) + 1.0);
  id v20 = [(PLBatteryUIMoveableGraphView *)self graphBackgroundColor];
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v20 CGColor]);

  v68.origin.double x = self->horizontal_label_offset;
  v68.size.double width = self->rectWidth;
  v68.size.double height = self->rectHeight;
  v68.origin.double y = 0.0;
  CGContextFillRect(a3, v68);
  CGContextSetLineWidth(a3, 0.6);
  id v21 = [(PLBatteryUIMoveableGraphView *)self gridColor];
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v21 CGColor]);

  *(_OWORD *)lengths = xmmword_9B530;
  CGContextSetLineDash(a3, 0.0, lengths, 2uLL);
  [(PLBatteryUIMoveableGraphView *)self displayRange];
  -[PLBatteryUIMoveableGraphView setGridRange:](self, "setGridRange:");
  double v23 = v22;
  double v24 = +[NSCalendar currentCalendar];
  double v25 = [(PLBatteryUIMoveableGraphView *)self endDate];
  float v26 = [v24 components:192 fromDate:v25];

  LODWORD(v24) = [v26 minute];
  v59 = v26;
  unsigned int v27 = [v26 second];
  uint64_t v28 = 40;
  double xInterval = self->xInterval;
  double v30 = xInterval * (double)((int)(v27 + 60 * v24) % (int)v23);
  double v31 = v23 * xInterval;
  double rectHeight = self->rectHeight;
  double horizontal_label_offset = self->horizontal_label_offset;
  double v34 = self->rectWidth + horizontal_label_offset - v30;
  BOOL v35 = v34 < horizontal_label_offset;
  double v36 = rectHeight;
  if (!v35)
  {
    do
    {
      CGContextMoveToPoint(a3, v34, 0.0);
      CGContextAddLineToPoint(a3, v34, self->rectHeight);
      double v34 = v34 - v31;
    }
    while (v34 >= self->horizontal_label_offset);
    double v36 = self->rectHeight;
  }
  if (v36 >= 0.0)
  {
    double v37 = 0.0;
    double v38 = rectHeight / 10.0;
    do
    {
      CGContextMoveToPoint(a3, self->horizontal_label_offset, v36 - v37);
      CGContextAddLineToPoint(a3, self->horizontal_label_offset + self->rectWidth, self->rectHeight - v37);
      double v37 = v38 + v37;
      double v36 = self->rectHeight;
    }
    while (v37 <= v36);
  }
  CGContextStrokePath(a3);
  CGContextSetLineDash(a3, 0.0, 0, 0);
  CGContextSetLineWidth(a3, 1.0);
  id v39 = [(PLBatteryUIMoveableGraphView *)self lineColor];
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v39 CGColor]);

  [(PLBatteryUIMoveableGraphView *)self displayRange];
  double v41 = self->horizontal_label_offset;
  double v42 = self->rectWidth + v41 - v30;
  if (v42 >= v41)
  {
    double v43 = v15;
    double v65 = v13 * 0.5;
    double v44 = v64 + v15 * -2.0;
    double v45 = v15 + v44;
    double v46 = -(double)(int)(v40 * self->xInterval / v31 * 0.5);
    do
    {
      [v8 setDateFormat:@"MM/dd"];
      double v47 = (v42 - self->horizontal_label_offset) / self->xInterval;
      v48 = [(PLBatteryUIMoveableGraphView *)self startDate];
      +[NSDate dateWithTimeInterval:v48 sinceDate:v47];
      uint64_t v49 = v28;
      v51 = uint64_t v50 = v11;
      v66 = [v8 stringFromDate:v51];

      [v8 setDateFormat:@"HH:mm"];
      double v52 = (v42 - self->horizontal_label_offset) / self->xInterval;
      v53 = [(PLBatteryUIMoveableGraphView *)self startDate];
      v54 = +[NSDate dateWithTimeInterval:v53 sinceDate:v52];
      v55 = [v8 stringFromDate:v54];

      uint64_t v11 = v50;
      uint64_t v28 = v49;
      double v56 = v42 - v65;
      if (v42 - v65 < 0.0) {
        double v56 = 0.0;
      }
      double v57 = *(double *)((char *)&self->super.super.super.isa + v49);
      if (v13 + v56 <= v57) {
        double v58 = v56;
      }
      else {
        double v58 = v57 - v13;
      }
      objc_msgSend(v55, "drawInRect:withAttributes:", *(Class *)((char *)&self->super.super.super.isa + v11), v58, v44, v13, v43);
      objc_msgSend(v66, "drawInRect:withAttributes:", *(Class *)((char *)&self->super.super.super.isa + v11), v58, v45, v13, v43);
      CGContextMoveToPoint(a3, v42, self->rectHeight + -2.0);
      CGContextAddLineToPoint(a3, v42, self->rectHeight + 2.0);

      double v42 = v42 + v46 * v31;
    }
    while (v42 >= self->horizontal_label_offset);
  }
  CGContextStrokePath(a3);
  -[PLBatteryUIMoveableGraphView drawDayLines:andRect:](self, "drawDayLines:andRect:", a3, x, y, v63, v64);
}

- (void)drawDayLines:(CGContext *)a3 andRect:(CGRect)a4
{
  [(NSMutableArray *)self->_dateChangeArray removeAllObjects];
  double v6 = +[NSCalendar currentCalendar];
  double v7 = [(PLBatteryUIMoveableGraphView *)self endDate];
  id v8 = [v6 components:224 fromDate:v7];

  uint64_t v9 = 3600 * (void)[v8 hour];
  uint64_t v10 = v9 + 60 * (void)[v8 minute];
  double v29 = v8;
  double v11 = -(double)((uint64_t)[v8 second] + v10);
  double v12 = [(PLBatteryUIMoveableGraphView *)self endDate];
  double v13 = +[NSDate dateWithTimeInterval:v12 sinceDate:v11];

  id v14 = objc_alloc_init((Class)NSDateFormatter);
  [v14 setDateFormat:@"MM/dd"];
  CGContextSetLineWidth(a3, 1.5);
  id v15 = [(PLBatteryUIMoveableGraphView *)self gridColor];
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v15 CGColor]);

  double v16 = [(PLBatteryUIMoveableGraphView *)self startDate];
  [v16 timeIntervalSinceDate:v13];
  double v18 = v17;

  if (v18 >= 0.0)
  {
    double v25 = v13;
  }
  else
  {
    do
    {
      double v19 = [(PLBatteryUIMoveableGraphView *)self startDate];
      [v13 timeIntervalSinceDate:v19];
      double v21 = v20 * self->xInterval;

      CGContextMoveToPoint(a3, v21 + self->horizontal_label_offset, 0.0);
      CGContextAddLineToPoint(a3, v21 + self->horizontal_label_offset, self->rectHeight);
      double v22 = +[NSNumber numberWithDouble:v21 + self->horizontal_label_offset];
      v30[0] = v22;
      double v23 = [v14 stringFromDate:v13];
      v30[1] = v23;
      double v24 = +[NSArray arrayWithObjects:v30 count:2];

      [(NSMutableArray *)self->_dateChangeArray addObject:v24];
      double v25 = +[NSDate dateWithTimeInterval:v13 sinceDate:-86400.0];

      float v26 = [(PLBatteryUIMoveableGraphView *)self startDate];
      [v26 timeIntervalSinceDate:v25];
      double v28 = v27;

      double v13 = v25;
    }
    while (v28 < 0.0);
  }
  CGContextStrokePath(a3);
}

- (void)drawLine:(CGContext *)a3 andRect:(CGRect)a4
{
  if (self->_inputData)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    CGContextSetLineWidth(a3, 1.0);
    id v8 = [(PLBatteryUIMoveableGraphView *)self lineColor];
    CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v8 CGColor]);

    double vertical_label_offset = self->vertical_label_offset;
    float maxPower = self->maxPower;
    float minPower = self->minPower;
    double horizontal_label_offset = self->horizontal_label_offset;
    double v13 = [(PLBatteryUIMoveableGraphView *)self endDate];
    id v14 = [(PLBatteryUIMoveableGraphView *)self startDate];
    [v13 timeIntervalSinceDate:v14];
    double v16 = v15;

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = [(PLBatteryUIMoveableGraphView *)self inputData];
    id v17 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (!v17) {
      goto LABEL_21;
    }
    id v18 = v17;
    char v19 = 0;
    double v20 = (height - vertical_label_offset) / (float)((float)(maxPower - minPower) + 1.0);
    uint64_t v21 = *(void *)v42;
    double v22 = -1.0;
    double v23 = (width - horizontal_label_offset) / v16;
    while (1)
    {
      double v24 = 0;
      double v25 = v22;
      do
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(obj);
        }
        float v26 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v24);
        double v27 = [v26 objectAtIndexedSubscript:1];
        [v27 floatValue];
        double v29 = v28;

        double v30 = [v26 objectAtIndexedSubscript:0];
        double v31 = v20 * (v29 - self->minPower);
        double v32 = [(PLBatteryUIMoveableGraphView *)self startDate];
        [v30 timeIntervalSinceDate:v32];
        double v34 = v23 * v33;

        double v35 = height - self->vertical_label_offset - v31;
        double v36 = self->horizontal_label_offset;
        double v22 = v34 + v36;
        if ((v19 & 1) == 0)
        {
          CGContextMoveToPoint(a3, v34 + v36, v35);
          goto LABEL_15;
        }
        if ([(PLBatteryUIMoveableGraphView *)self graphType] == 2)
        {
          double v37 = a3;
          CGFloat v38 = v25;
          CGFloat v39 = v35;
LABEL_13:
          CGContextAddLineToPoint(v37, v38, v39);
          goto LABEL_14;
        }
        if ([(PLBatteryUIMoveableGraphView *)self graphType] == 1)
        {
          double v37 = a3;
          CGFloat v38 = v22;
          CGFloat v39 = v25;
          goto LABEL_13;
        }
LABEL_14:
        CGContextAddLineToPoint(a3, v22, v35);
LABEL_15:
        if ([(PLBatteryUIMoveableGraphView *)self graphType] != 2)
        {
          if ([(PLBatteryUIMoveableGraphView *)self graphType] == 1) {
            double v22 = v35;
          }
          else {
            double v22 = v25;
          }
        }

        double v24 = (char *)v24 + 1;
        char v19 = 1;
        double v25 = v22;
      }
      while (v18 != v24);
      id v18 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (!v18)
      {
LABEL_21:

        CGContextStrokePath(a3);
        return;
      }
    }
  }
}

- (void)drawFill:(CGContext *)a3 andRect:(CGRect)a4
{
  if (self->_inputData)
  {
    CGContextSetLineWidth(a3, 0.5);
    id v6 = [(PLBatteryUIMoveableGraphView *)self lineColor];
    CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v6 CGColor]);

    CGContextBeginPath(a3);
    CGContextMoveToPoint(a3, self->horizontal_label_offset, self->rectHeight);
    if ([(PLBatteryUIMoveableGraphView *)self graphType] == 2) {
      uint64_t v7 = 24;
    }
    else {
      uint64_t v7 = 48;
    }
    double v8 = *(double *)((char *)&self->super.super.super.isa + v7);
    double horizontal_label_offset = self->horizontal_label_offset;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = [(PLBatteryUIMoveableGraphView *)self inputData];
    id v10 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v38;
      do
      {
        double v13 = 0;
        double v14 = v8;
        do
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(obj);
          }
          double v15 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v13);
          double v16 = [v15 objectAtIndexedSubscript:1];
          [v16 floatValue];
          double v18 = v17;

          char v19 = [v15 objectAtIndexedSubscript:0];
          double v20 = (v18 - self->minPower) * self->yInterval;
          uint64_t v21 = [(PLBatteryUIMoveableGraphView *)self startDate];
          [v19 timeIntervalSinceDate:v21];
          double v23 = v22 * self->xInterval;

          double v24 = self->rectHeight - v20;
          double horizontal_label_offset = v23 + self->horizontal_label_offset;
          if ([(PLBatteryUIMoveableGraphView *)self graphType] == 2)
          {
            double v25 = a3;
            CGFloat v26 = v14;
            CGFloat v27 = v24;
          }
          else
          {
            if ([(PLBatteryUIMoveableGraphView *)self graphType] != 1) {
              goto LABEL_15;
            }
            double v25 = a3;
            CGFloat v26 = horizontal_label_offset;
            CGFloat v27 = v14;
          }
          CGContextAddLineToPoint(v25, v26, v27);
LABEL_15:
          CGContextAddLineToPoint(a3, horizontal_label_offset, v24);
          double v8 = horizontal_label_offset;
          if ([(PLBatteryUIMoveableGraphView *)self graphType] != 2)
          {
            if ([(PLBatteryUIMoveableGraphView *)self graphType] == 1) {
              double v8 = v24;
            }
            else {
              double v8 = v14;
            }
          }

          double v13 = (char *)v13 + 1;
          double v14 = v8;
        }
        while (v11 != v13);
        id v11 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v11);
    }

    CGContextAddLineToPoint(a3, horizontal_label_offset, self->rectHeight);
    CGContextClosePath(a3);
    id v28 = [(PLBatteryUIMoveableGraphView *)self lineColor];
    double v29 = (CGColor *)[v28 CGColor];

    double v30 = CGColorGetComponents(v29);
    *(_OWORD *)locations = xmmword_9B6A0;
    CGFloat v31 = v30[1];
    components[0] = *v30;
    components[1] = v31;
    uint64_t v42 = *((void *)v30 + 2);
    uint64_t v43 = 0x3FC999999999999ALL;
    CGFloat v44 = components[0];
    CGFloat v45 = v31;
    uint64_t v46 = v42;
    uint64_t v47 = 0x3FF0000000000000;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    double v33 = CGGradientCreateWithColorComponents(DeviceRGB, components, locations, 2uLL);
    double v34 = self->horizontal_label_offset;
    double rectHeight = self->rectHeight;
    CGContextSaveGState(a3);
    CGContextClip(a3);
    v51.double y = 0.0;
    v50.double x = v34;
    v50.double y = rectHeight;
    v51.double x = v34;
    CGContextDrawLinearGradient(a3, v33, v50, v51, 0);
    CGContextRestoreGState(a3);
    CGColorSpaceRelease(DeviceRGB);
    CGGradientRelease(v33);
  }
}

- (void)drawErrorText:(CGContext *)a3 andRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  int errValue = self->_errValue;
  CFStringRef v8 = @"Not Enough Data Points";
  if (errValue != 2) {
    CFStringRef v8 = 0;
  }
  if (errValue == 1) {
    uint64_t v9 = @"Negative Power Value";
  }
  else {
    uint64_t v9 = (__CFString *)v8;
  }
  defaultTextAttributes = self->defaultTextAttributes;
  double v13 = v9;
  [(__CFString *)v13 sizeWithAttributes:defaultTextAttributes];
  -[__CFString drawInRect:withAttributes:](v13, "drawInRect:withAttributes:", self->defaultTextAttributes, (width - v11) * 0.5, (height - v12) * 0.5, v11);
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  id v9 = +[UIColor clearColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v9 CGColor]);

  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  CGContextFillRect(CurrentContext, v11);
  if (self->_errValue)
  {
    [(PLBatteryUIMoveableGraphView *)self setDefaultRange];
    -[PLBatteryUIMoveableGraphView drawGrid:andRect:](self, "drawGrid:andRect:", CurrentContext, x, y, width, height);
    -[PLBatteryUIMoveableGraphView drawErrorText:andRect:](self, "drawErrorText:andRect:", CurrentContext, x, y, width, height);
  }
  else
  {
    -[PLBatteryUIMoveableGraphView drawGrid:andRect:](self, "drawGrid:andRect:", CurrentContext, x, y, width, height);
    -[PLBatteryUIMoveableGraphView drawFill:andRect:](self, "drawFill:andRect:", CurrentContext, x, y, width, height);
    -[PLBatteryUIMoveableGraphView drawLine:andRect:](self, "drawLine:andRect:", CurrentContext, x, y, width, height);
  }
}

- (id)DateChangeArray
{
  return self->_dateChangeArray;
}

- (double)displayRange
{
  return self->_displayRange;
}

- (CGSize)displaySize
{
  double width = self->_displaySize.width;
  double height = self->_displaySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDisplaySize:(CGSize)a3
{
  self->_displaySize = a3;
}

- (double)MaxDataRange
{
  return self->_MaxDataRange;
}

- (void)setMaxDataRange:(double)a3
{
  self->_MaxDataRange = a3;
}

- (int)graphType
{
  return self->_graphType;
}

- (void)setGraphType:(int)a3
{
  self->_graphType = a3;
}

- (NSMutableArray)inputData
{
  return self->_inputData;
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (UIColor)graphBackgroundColor
{
  return self->_graphBackgroundColor;
}

- (void)setGraphBackgroundColor:(id)a3
{
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
}

- (UIColor)gridColor
{
  return self->_gridColor;
}

- (void)setGridColor:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_gridColor, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_graphBackgroundColor, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_dateChangeArray, 0);

  objc_storeStrong((id *)&self->defaultTextAttributes, 0);
}

@end