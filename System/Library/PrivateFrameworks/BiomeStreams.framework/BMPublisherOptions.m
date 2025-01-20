@interface BMPublisherOptions
+ (id)reversed;
- (BMIndexSearch)indexSearch;
- (BMPublisherOptions)init;
- (BMPublisherOptions)initWithStartDate:(id)a3 endDate:(id)a4 indexSearch:(id)a5 maxEvents:(unint64_t)a6 lastN:(unint64_t)a7 reversed:(BOOL)a8;
- (BMPublisherOptions)initWithStartDate:(id)a3 endDate:(id)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 reversed:(BOOL)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)reversed;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)description;
- (unint64_t)hash;
- (unint64_t)lastN;
- (unint64_t)maxEvents;
- (void)setEndDate:(id)a3;
- (void)setIndexSearch:(id)a3;
- (void)setLastN:(unint64_t)a3;
- (void)setMaxEvents:(unint64_t)a3;
- (void)setReversed:(BOOL)a3;
- (void)setStartDate:(id)a3;
@end

@implementation BMPublisherOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSearch, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (BMPublisherOptions)initWithStartDate:(id)a3 endDate:(id)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 reversed:(BOOL)a7
{
  return [(BMPublisherOptions *)self initWithStartDate:a3 endDate:a4 indexSearch:0 maxEvents:a5 lastN:a6 reversed:a7];
}

- (BMPublisherOptions)initWithStartDate:(id)a3 endDate:(id)a4 indexSearch:(id)a5 maxEvents:(unint64_t)a6 lastN:(unint64_t)a7 reversed:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)BMPublisherOptions;
  v18 = [(BMPublisherOptions *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a3);
    objc_storeStrong((id *)&v19->_endDate, a4);
    objc_storeStrong((id *)&v19->_indexSearch, a5);
    v19->_maxEvents = a6;
    v19->_lastN = a7;
    v19->_reversed = a8;
  }

  return v19;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (unint64_t)maxEvents
{
  return self->_maxEvents;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)lastN
{
  return self->_lastN;
}

- (BOOL)reversed
{
  return self->_reversed;
}

- (BMIndexSearch)indexSearch
{
  return self->_indexSearch;
}

- (BMPublisherOptions)init
{
  return [(BMPublisherOptions *)self initWithStartDate:0 endDate:0 maxEvents:0 lastN:0 reversed:0];
}

+ (id)reversed
{
  v2 = (void *)[objc_alloc((Class)a1) initWithStartDate:0 endDate:0 maxEvents:0 lastN:0 reversed:1];

  return v2;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_startDate hash];
  return [(NSDate *)self->_endDate hash] ^ v3 ^ self->_maxEvents ^ (2 * self->_lastN) ^ (4 * self->_reversed);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NSDate **)v4;
    startDate = self->_startDate;
    BOOL v8 = (startDate == v5[2] || -[NSDate isEqual:](startDate, "isEqual:"))
      && ((endDate = self->_endDate, endDate == v5[3]) || -[NSDate isEqual:](endDate, "isEqual:"))
      && (NSDate *)self->_maxEvents == v5[4]
      && (NSDate *)self->_lastN == v5[5]
      && self->_reversed == *((unsigned __int8 *)v5 + 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p> startDate: %@, endDate: %@, maxEvents: %lu, lastN: %lu, reversed: %d", objc_opt_class(), self, self->_startDate, self->_endDate, self->_maxEvents, self->_lastN, self->_reversed];

  return v2;
}

- (void)setStartDate:(id)a3
{
}

- (void)setEndDate:(id)a3
{
}

- (void)setMaxEvents:(unint64_t)a3
{
  self->_maxEvents = a3;
}

- (void)setLastN:(unint64_t)a3
{
  self->_lastN = a3;
}

- (void)setReversed:(BOOL)a3
{
  self->_reversed = a3;
}

- (void)setIndexSearch:(id)a3
{
}

@end