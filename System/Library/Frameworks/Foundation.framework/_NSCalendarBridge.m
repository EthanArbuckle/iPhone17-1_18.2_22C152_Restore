@interface _NSCalendarBridge
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (_NSCalendarBridge)initWithCalendarIdentifier:(id)a3;
- (id)_components:(unint64_t)a3 fromDate:(id)a4;
- (id)_componentsInTimeZone:(id)a3 fromDate:(id)a4;
- (id)_dateFromComponents:(id)a3;
- (id)components:(unint64_t)a3 fromDate:(id)a4;
- (id)componentsInTimeZone:(id)a3 fromDate:(id)a4;
- (id)dateFromComponents:(id)a3;
- (void)_enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
@end

@implementation _NSCalendarBridge

- (id)components:(unint64_t)a3 fromDate:(id)a4
{
  if (a4) {
    return -[_NSCalendarBridge _components:fromDate:](self, "_components:fromDate:", a3);
  }
  else {
    return 0;
  }
}

- (id)dateFromComponents:(id)a3
{
  if (a3) {
    return -[_NSCalendarBridge _dateFromComponents:](self, "_dateFromComponents:");
  }
  else {
    return 0;
  }
}

- (_NSCalendarBridge)initWithCalendarIdentifier:(id)a3
{
  if (!_NSIsNSString()) {
    return 0;
  }

  return [(_NSCalendarBridge *)self initWithCheckedCalendarIdentifier:a3];
}

- (id)componentsInTimeZone:(id)a3 fromDate:(id)a4
{
  if (!a3)
  {
    a3 = (id)[(_NSCalendarBridge *)self timeZone];
    if (!a3) {
      a3 = (id)[MEMORY[0x1E4F1CAF0] systemTimeZone];
    }
  }

  return [(_NSCalendarBridge *)self _componentsInTimeZone:a3 fromDate:a4];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  v6[5] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __91___NSCalendarBridge_enumerateDatesStartingAfterDate_matchingComponents_options_usingBlock___block_invoke;
    v6[3] = &unk_1E51F6C58;
    v6[4] = a6;
    [(_NSCalendarBridge *)self _enumerateDatesStartingAfterDate:a3 matchingComponents:a4 options:a5 usingBlock:v6];
  }
}

- (void)_enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  v8 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v8);
}

- (id)_componentsInTimeZone:(id)a3 fromDate:(id)a4
{
  v6 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)_components:(unint64_t)a3 fromDate:(id)a4
{
  v6 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)_dateFromComponents:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end