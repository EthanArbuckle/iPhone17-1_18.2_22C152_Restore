@interface HKCategoricalDateAxis
+ (double)_categoryLocationMinutesForCategoryCount:(int64_t)a3;
+ (double)_categoryStartLocationMinutesForCategoryCount:(int64_t)a3;
+ (id)datePositionForCategoryIndex:(int64_t)a3 categoryCount:(int64_t)a4 startDate:(id)a5 calendar:(id)a6;
- (BOOL)canAddLabelForAxisLabelType:(int64_t)a3;
- (HKCategoricalDateAxis)initWithCurrentCalendar:(id)a3 axisStyle:(id)a4 categoryTitles:(id)a5;
- (NSArray)categoryTitles;
- (NSDateComponents)majorAxisIntervalComponents;
- (NSDateComponents)minorAxisIntervalComponents;
- (id)baseDateForDate:(id)a3 components:(id)a4 calendar:(id)a5;
- (id)nextDateForDate:(id)a3 components:(id)a4 timeScope:(int64_t)a5 calendar:(id)a6;
- (id)stringForDate:(id)a3 zoom:(int64_t)a4 labelType:(int64_t)a5;
- (int64_t)categoriesStartMinutePosition;
- (void)setCategoriesStartMinutePosition:(int64_t)a3;
- (void)setCategoryTitles:(id)a3;
- (void)setMajorAxisIntervalComponents:(id)a3;
- (void)setMinorAxisIntervalComponents:(id)a3;
@end

@implementation HKCategoricalDateAxis

- (HKCategoricalDateAxis)initWithCurrentCalendar:(id)a3 axisStyle:(id)a4 categoryTitles:(id)a5
{
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HKCategoricalDateAxis;
  v10 = [(HKDateAxis *)&v18 initWithCurrentCalendar:a3 axisStyle:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_categoryTitles, a5);
    +[HKCategoricalDateAxis _categoryStartLocationMinutesForCategoryCount:](HKCategoricalDateAxis, "_categoryStartLocationMinutesForCategoryCount:", [v9 count]);
    v11->_categoriesStartMinutePosition = (uint64_t)v12;
    v13 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    minorAxisIntervalComponents = v11->_minorAxisIntervalComponents;
    v11->_minorAxisIntervalComponents = v13;

    [(NSDateComponents *)v11->_minorAxisIntervalComponents setMinute:v11->_categoriesStartMinutePosition];
    v15 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    majorAxisIntervalComponents = v11->_majorAxisIntervalComponents;
    v11->_majorAxisIntervalComponents = v15;

    [(NSDateComponents *)v11->_majorAxisIntervalComponents setMinute:(uint64_t)((double)v11->_categoriesStartMinutePosition + (double)v11->_categoriesStartMinutePosition)];
  }

  return v11;
}

- (id)baseDateForDate:(id)a3 components:(id)a4 calendar:(id)a5
{
  return (id)objc_msgSend(a5, "hk_startOfDateByAddingDays:toDate:", 0, a3);
}

- (id)nextDateForDate:(id)a3 components:(id)a4 timeScope:(int64_t)a5 calendar:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  double v12 = [v11 dateByAddingComponents:v10 toDate:v9 options:0];
  v13 = [v11 components:126 fromDate:v12];
  uint64_t v14 = [v13 hour];
  uint64_t v15 = [v13 minute] + 60 * v14;
  if (!(v15 % [v10 minute]))
  {
    id v24 = v12;
    goto LABEL_9;
  }
  v16 = [v11 startOfDayForDate:v9];
  v29 = objc_msgSend(v11, "hk_dateByAddingDays:toDate:", 1, v16);
  [v29 timeIntervalSinceDate:v16];
  double v18 = v17;
  uint64_t v19 = [v10 minute];
  v20 = [(HKCategoricalDateAxis *)self minorAxisIntervalComponents];
  uint64_t v21 = [v20 minute];

  if (v19 == v21)
  {
    v22 = [(HKCategoricalDateAxis *)self categoryTitles];
    double v23 = v18 / (double)(unint64_t)[v22 count] * 0.5;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v25 = [v10 minute];
  v26 = [(HKCategoricalDateAxis *)self majorAxisIntervalComponents];
  uint64_t v27 = [v26 minute];

  double v23 = 0.0;
  if (v25 == v27)
  {
    v22 = [(HKCategoricalDateAxis *)self categoryTitles];
    double v23 = v18 / (double)(unint64_t)[v22 count];
    goto LABEL_7;
  }
LABEL_8:
  id v24 = [v9 dateByAddingTimeInterval:v23];

LABEL_9:
  return v24;
}

- (BOOL)canAddLabelForAxisLabelType:(int64_t)a3
{
  return a3 == 2;
}

- (id)stringForDate:(id)a3 zoom:(int64_t)a4 labelType:(int64_t)a5
{
  id v8 = a3;
  BOOL v9 = [(HKCategoricalDateAxis *)self canAddLabelForAxisLabelType:a5];
  id v10 = 0;
  if (a4 == 6 && v9)
  {
    id v11 = [(HKCategoricalDateAxis *)self categoryTitles];
    uint64_t v12 = [v11 count];

    v13 = [(HKDateAxis *)self currentCalendar];
    uint64_t v14 = [v13 startOfDayForDate:v8];

    if (v12 < 1)
    {
LABEL_7:
      id v10 = 0;
    }
    else
    {
      uint64_t v15 = 0;
      while (1)
      {
        v16 = [(HKDateAxis *)self currentCalendar];
        double v17 = +[HKCategoricalDateAxis datePositionForCategoryIndex:v15 categoryCount:v12 startDate:v14 calendar:v16];

        if ([v8 isEqual:v17]) {
          break;
        }

        if (v12 == ++v15) {
          goto LABEL_7;
        }
      }
      double v18 = [(HKCategoricalDateAxis *)self categoryTitles];
      id v10 = [v18 objectAtIndexedSubscript:v15];
    }
  }

  return v10;
}

+ (id)datePositionForCategoryIndex:(int64_t)a3 categoryCount:(int64_t)a4 startDate:(id)a5 calendar:(id)a6
{
  id v9 = a5;
  id v10 = objc_msgSend(a6, "hk_dateByAddingDays:toDate:", 1, v9);
  [v10 timeIntervalSinceDate:v9];
  uint64_t v12 = [v9 dateByAddingTimeInterval:v11 / (double)a4 * 0.5 + (double)a3 * (v11 / (double)a4)];

  return v12;
}

+ (double)_categoryLocationMinutesForCategoryCount:(int64_t)a3
{
  v4 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:6];
  [v4 canonicalSize];
  double v6 = v5;

  return v6 / (double)a3 / 60.0;
}

+ (double)_categoryStartLocationMinutesForCategoryCount:(int64_t)a3
{
  +[HKCategoricalDateAxis _categoryLocationMinutesForCategoryCount:a3];
  return v3 * 0.5;
}

- (NSArray)categoryTitles
{
  return self->_categoryTitles;
}

- (void)setCategoryTitles:(id)a3
{
}

- (int64_t)categoriesStartMinutePosition
{
  return self->_categoriesStartMinutePosition;
}

- (void)setCategoriesStartMinutePosition:(int64_t)a3
{
  self->_categoriesStartMinutePosition = a3;
}

- (NSDateComponents)minorAxisIntervalComponents
{
  return self->_minorAxisIntervalComponents;
}

- (void)setMinorAxisIntervalComponents:(id)a3
{
}

- (NSDateComponents)majorAxisIntervalComponents
{
  return self->_majorAxisIntervalComponents;
}

- (void)setMajorAxisIntervalComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_majorAxisIntervalComponents, 0);
  objc_storeStrong((id *)&self->_minorAxisIntervalComponents, 0);
  objc_storeStrong((id *)&self->_categoryTitles, 0);
}

@end