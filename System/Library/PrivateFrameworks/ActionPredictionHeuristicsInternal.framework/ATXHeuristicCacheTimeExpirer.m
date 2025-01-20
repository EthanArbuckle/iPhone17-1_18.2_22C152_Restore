@interface ATXHeuristicCacheTimeExpirer
+ (BOOL)supportsSecureCoding;
- (ATXHeuristicCacheTimeExpirer)initWithCoder:(id)a3;
- (ATXHeuristicCacheTimeExpirer)initWithFireDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)fireDate;
- (id)description;
- (unint64_t)hash;
- (void)_start;
- (void)_stop;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXHeuristicCacheTimeExpirer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

- (void)_stop
{
  source = self->_source;
  if (source) {
    dispatch_source_cancel(source);
  }
}

- (ATXHeuristicCacheTimeExpirer)initWithFireDate:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ATXHeuristicResultCache.m", 276, @"Invalid parameter not satisfying: %@", @"fireDate" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)ATXHeuristicCacheTimeExpirer;
  v6 = [(ATXHeuristicCacheExpirer *)&v13 init];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v9 = [v7 initWithTimeIntervalSinceReferenceDate:floor(v8)];
    fireDate = v6->_fireDate;
    v6->_fireDate = (NSDate *)v9;
  }
  return v6;
}

- (void)_start
{
  if (!self->_source)
  {
    [(NSDate *)self->_fireDate timeIntervalSinceNow];
    if (v3 > 0.0)
    {
      double v4 = v3;
      objc_initWeak(&location, self);
      id v5 = dispatch_get_global_queue(9, 0);
      v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v5);
      source = self->_source;
      self->_source = v6;

      double v8 = self->_source;
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
      v10 = self->_source;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __38__ATXHeuristicCacheTimeExpirer__start__block_invoke;
      v11[3] = &unk_1E68A5060;
      objc_copyWeak(&v12, &location);
      dispatch_source_set_event_handler(v10, v11);
      dispatch_resume((dispatch_object_t)self->_source);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __38__ATXHeuristicCacheTimeExpirer__start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained expire];
}

- (unint64_t)hash
{
  return [(NSDate *)self->_fireDate hash];
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (ATXHeuristicCacheTimeExpirer *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = self->_fireDate;
      v6 = v5;
      if (v5 == v4->_fireDate) {
        char v7 = 1;
      }
      else {
        char v7 = -[NSDate isEqual:](v5, "isEqual:");
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXHeuristicCacheTimeExpirer)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeuristicCacheTimeExpirer;
  id v5 = [(ATXHeuristicCacheExpirer *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fireDate"];
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v6;
  }
  return v5;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<expire at %@ (watching: %i)>", self->_fireDate, self->_source != 0];

  return v2;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

@end