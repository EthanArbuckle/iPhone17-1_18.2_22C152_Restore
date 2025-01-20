@interface BSUIDateLabelFactory
+ (id)sharedInstance;
- (BSUIDateLabelFactory)init;
- (id)_labelWithStartDate:(void *)a3 endDate:(void *)a4 timeZone:(uint64_t)a5 allDay:(uint64_t)a6 forStyle:(uint64_t)a7 forType:;
- (id)combinedDateLabelWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 forStyle:(int64_t)a7;
- (id)endLabelWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 forStyle:(int64_t)a7;
- (id)startLabelWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 forStyle:(int64_t)a7;
- (int64_t)styleForLabel:(id)a3;
- (void)_purgeRecycledLabels;
- (void)dealloc;
- (void)recycleLabel:(id)a3;
@end

@implementation BSUIDateLabelFactory

+ (id)sharedInstance
{
  if (qword_1EB3A3958 != -1) {
    dispatch_once(&qword_1EB3A3958, &__block_literal_global_2);
  }
  v2 = (void *)_MergedGlobals_10;

  return v2;
}

uint64_t __38__BSUIDateLabelFactory_sharedInstance__block_invoke()
{
  _MergedGlobals_10 = objc_alloc_init(BSUIDateLabelFactory);

  return MEMORY[0x1F41817F8]();
}

- (BSUIDateLabelFactory)init
{
  v7.receiver = self;
  v7.super_class = (Class)BSUIDateLabelFactory;
  v2 = [(BSUIDateLabelFactory *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    recycledLabelsByStyle = v2->_recycledLabelsByStyle;
    v2->_recycledLabelsByStyle = (NSMutableDictionary *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__purgeRecycledLabels name:*MEMORY[0x1E4F43670] object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43670] object:0];

  v4.receiver = self;
  v4.super_class = (Class)BSUIDateLabelFactory;
  [(BSUIDateLabelFactory *)&v4 dealloc];
}

- (id)_labelWithStartDate:(void *)a3 endDate:(void *)a4 timeZone:(uint64_t)a5 allDay:(uint64_t)a6 forStyle:(uint64_t)a7 forType:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  if (a1)
  {
    v16 = [NSNumber numberWithInt:a6];
    v17 = [*(id *)(a1 + 8) objectForKey:v16];
    id v18 = [v17 anyObject];
    if (v18)
    {
      [v17 removeObject:v18];
LABEL_9:
      [v18 startCoalescingUpdates];
      [v18 setLabelType:a7];
      [v18 setStartDate:v13 withTimeZone:v15];
      if (v14) {
        id v20 = v14;
      }
      else {
        id v20 = v13;
      }
      [v18 setEndDate:v20 withTimeZone:v15];
      [v18 setAllDay:a5];
      [v18 stopCoalescingUpdates];
      goto LABEL_13;
    }
    if (a6 == 1)
    {
      v19 = off_1E5ABCEF8;
    }
    else
    {
      if (a6)
      {
        id v18 = 0;
        goto LABEL_13;
      }
      v19 = off_1E5ABCED0;
    }
    id v18 = objc_alloc_init(*v19);
    if (v18) {
      goto LABEL_9;
    }
LABEL_13:

    goto LABEL_14;
  }
  id v18 = 0;
LABEL_14:

  return v18;
}

- (id)startLabelWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 forStyle:(int64_t)a7
{
  objc_super v7 = -[BSUIDateLabelFactory _labelWithStartDate:endDate:timeZone:allDay:forStyle:forType:]((uint64_t)self, a3, a4, a5, a6, a7, 0);

  return v7;
}

- (id)endLabelWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 forStyle:(int64_t)a7
{
  objc_super v7 = -[BSUIDateLabelFactory _labelWithStartDate:endDate:timeZone:allDay:forStyle:forType:]((uint64_t)self, a3, a4, a5, a6, a7, 1);

  return v7;
}

- (id)combinedDateLabelWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 forStyle:(int64_t)a7
{
  objc_super v7 = -[BSUIDateLabelFactory _labelWithStartDate:endDate:timeZone:allDay:forStyle:forType:]((uint64_t)self, a3, a4, a5, a6, a7, 2 * (a4 != 0));

  return v7;
}

- (void)recycleLabel:(id)a3
{
  id v7 = a3;
  int64_t v4 = -[BSUIDateLabelFactory styleForLabel:](self, "styleForLabel:");
  if (v4 != -1)
  {
    v5 = [NSNumber numberWithInt:v4];
    v6 = [(NSMutableDictionary *)self->_recycledLabelsByStyle objectForKey:v5];
    if (!v6)
    {
      v6 = [MEMORY[0x1E4F1CA80] set];
      -[NSMutableDictionary setObject:forKey:](self->_recycledLabelsByStyle, "setObject:forKey:");
    }
    [v7 prepareForReuse];
    if ((unint64_t)[v6 count] <= 9) {
      [v6 addObject:v7];
    }
  }
}

- (int64_t)styleForLabel:(id)a3
{
  id v3 = a3;
  int64_t v4 = objc_opt_class();
  if ([v4 isEqual:objc_opt_class()]) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = [v4 isEqual:objc_opt_class()] - 1;
  }

  return v5;
}

- (void)_purgeRecycledLabels
{
}

- (void).cxx_destruct
{
}

@end