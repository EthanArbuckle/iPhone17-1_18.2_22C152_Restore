@interface HMMCoreDataGroupValueStatistics
+ (id)fetchRequest;
- (HMMCounterStatistics)counterStatistics;
- (id)addValue:(int64_t)a3;
@end

@implementation HMMCoreDataGroupValueStatistics

- (id)addValue:(int64_t)a3
{
  if (![(HMMCoreDataGroupValueStatistics *)self count])
  {
    [(HMMCoreDataGroupValueStatistics *)self setMin:a3];
    v5 = &unk_1F2C87730;
    goto LABEL_7;
  }
  if ([(HMMCoreDataGroupValueStatistics *)self min] > a3) {
    [(HMMCoreDataGroupValueStatistics *)self setMin:a3];
  }
  if ([(HMMCoreDataGroupValueStatistics *)self max] < a3)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -[HMMCoreDataGroupValueStatistics max](self, "max"));
LABEL_7:
    [(HMMCoreDataGroupValueStatistics *)self setMax:a3];
    goto LABEL_9;
  }
  v5 = 0;
LABEL_9:
  [(HMMCoreDataGroupValueStatistics *)self setSum:[(HMMCoreDataGroupValueStatistics *)self sum] + a3];
  [(HMMCoreDataGroupValueStatistics *)self setCount:[(HMMCoreDataGroupValueStatistics *)self count] + 1];
  return v5;
}

- (HMMCounterStatistics)counterStatistics
{
  v2 = [[HMMCounterStatistics alloc] initWithMinValue:[(HMMCoreDataGroupValueStatistics *)self min] maxValue:[(HMMCoreDataGroupValueStatistics *)self max] sumOfValues:[(HMMCoreDataGroupValueStatistics *)self sum] valueCount:[(HMMCoreDataGroupValueStatistics *)self count]];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"GroupValueStatistics"];
}

@end