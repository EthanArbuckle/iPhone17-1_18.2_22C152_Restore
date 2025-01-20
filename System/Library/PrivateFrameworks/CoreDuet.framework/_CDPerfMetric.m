@interface _CDPerfMetric
- (NSDate)lastUpdate;
- (NSString)name;
- (NSString)string;
- (_CDPerfMetric)initWithName:(id)a3 string:(id)a4 family:(id)a5;
- (_CDPerfMetricFamily)family;
- (double)averageElapsedTime;
- (double)lastElapsedTime;
- (double)maximumElapsedTime;
- (double)minimumElapsedTime;
- (double)totalElapsedTime;
- (unint64_t)count;
- (unint64_t)errorCount;
- (unint64_t)lastResultCount;
@end

@implementation _CDPerfMetric

- (_CDPerfMetric)initWithName:(id)a3 string:(id)a4 family:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_CDPerfMetric;
  v12 = [(_CDPerfMetric *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_string, a4);
    objc_storeWeak((id *)&v13->_family, v11);
  }

  return v13;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t count = self->_count;
  os_unfair_lock_unlock(p_lock);
  return count;
}

- (double)lastElapsedTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lastElapsedTime = self->_lastElapsedTime;
  os_unfair_lock_unlock(p_lock);
  return lastElapsedTime;
}

- (double)minimumElapsedTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double minimumElapsedTime = self->_minimumElapsedTime;
  os_unfair_lock_unlock(p_lock);
  return minimumElapsedTime;
}

- (double)maximumElapsedTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double maximumElapsedTime = self->_maximumElapsedTime;
  os_unfair_lock_unlock(p_lock);
  return maximumElapsedTime;
}

- (double)averageElapsedTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t count = self->_count;
  if (count) {
    double v5 = self->_totalElapsedTime / (double)count;
  }
  else {
    double v5 = 0.0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSDate)lastUpdate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_lastUpdateTime];
  os_unfair_lock_unlock(p_lock);
  return (NSDate *)v4;
}

- (unint64_t)lastResultCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lastResultCount = self->_lastResultCount;
  os_unfair_lock_unlock(p_lock);
  return lastResultCount;
}

- (unint64_t)errorCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t errorCount = self->_errorCount;
  os_unfair_lock_unlock(p_lock);
  return errorCount;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (double)totalElapsedTime
{
  return self->_totalElapsedTime;
}

- (_CDPerfMetricFamily)family
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_family);
  return (_CDPerfMetricFamily *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_family);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end