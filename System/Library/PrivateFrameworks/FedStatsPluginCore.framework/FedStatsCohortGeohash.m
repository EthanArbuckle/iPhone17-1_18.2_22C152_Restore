@interface FedStatsCohortGeohash
+ (id)cohortInstanceWithPrecision:(unint64_t)a3;
- (FedStatsCohortGeohash)initWithPrecision:(unint64_t)a3;
- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4;
- (unint64_t)precision;
@end

@implementation FedStatsCohortGeohash

- (FedStatsCohortGeohash)initWithPrecision:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FedStatsCohortGeohash;
  result = [(FedStatsCohortGeohash *)&v5 init];
  if (result) {
    result->_precision = a3;
  }
  return result;
}

+ (id)cohortInstanceWithPrecision:(unint64_t)a3
{
  if (a3 < 5)
  {
    v4 = [FedStatsCohortGeohash alloc];
    unint64_t v5 = a3;
  }
  else
  {
    v3 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      +[FedStatsCohortGeohash cohortInstanceWithPrecision:](v3);
    }

    v4 = [FedStatsCohortGeohash alloc];
    unint64_t v5 = 4;
  }
  v7 = [(FedStatsCohortGeohash *)v4 initWithPrecision:v5];
  return v7;
}

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  v6 = [a3 objectForKey:@"geohash"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "substringToIndex:", -[FedStatsCohortGeohash precision](self, "precision"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      *a4 = +[FedStatsPluginError errorWithCode:300 description:@"Parameter has no string value for geohash cohort key"];
    }
    v7 = @"<null>";
  }

  return v7;
}

- (unint64_t)precision
{
  return self->_precision;
}

+ (void)cohortInstanceWithPrecision:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = 4;
  _os_log_debug_impl(&dword_24DF73000, log, OS_LOG_TYPE_DEBUG, "Cohort precision exceeds max precision. Capping at %lu", (uint8_t *)&v1, 0xCu);
}

@end