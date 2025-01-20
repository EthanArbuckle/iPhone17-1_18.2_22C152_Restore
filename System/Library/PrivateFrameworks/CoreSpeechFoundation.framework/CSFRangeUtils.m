@interface CSFRangeUtils
- (BOOL)hasIntersectionWithRange:(id)a3;
- (CSFRangeUtils)initWithStartPoint:(unint64_t)a3 endPoint:(unint64_t)a4;
- (unint64_t)endPoint;
- (unint64_t)startPoint;
@end

@implementation CSFRangeUtils

- (unint64_t)endPoint
{
  return self->_endPoint;
}

- (unint64_t)startPoint
{
  return self->_startPoint;
}

- (BOOL)hasIntersectionWithRange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      v13 = "-[CSFRangeUtils hasIntersectionWithRange:]";
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Invalid input range", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_11;
  }
  unint64_t v6 = [v4 startPoint];
  unint64_t v7 = [v5 endPoint];
  unint64_t startPoint = self->_startPoint;
  if ((v7 < startPoint || v7 >= self->_endPoint)
    && (v6 < startPoint || v6 >= self->_endPoint)
    && (v6 > startPoint || v7 < self->_endPoint))
  {
LABEL_11:
    BOOL v9 = 0;
    goto LABEL_12;
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (CSFRangeUtils)initWithStartPoint:(unint64_t)a3 endPoint:(unint64_t)a4
{
  unint64_t v6 = self;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a4 >= a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)CSFRangeUtils;
    BOOL v9 = [(CSFRangeUtils *)&v11 init];
    if (v9)
    {
      v9->_unint64_t startPoint = a3;
      v9->_endPoint = a4;
    }
    unint64_t v6 = v9;
    v8 = v6;
  }
  else
  {
    unint64_t v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "-[CSFRangeUtils initWithStartPoint:endPoint:]";
      __int16 v14 = 2050;
      unint64_t v15 = a3;
      __int16 v16 = 2050;
      unint64_t v17 = a4;
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Invalid input : unint64_t startPoint = %{public}llu, endPoint = %{public}llu", buf, 0x20u);
    }
    v8 = 0;
  }

  return v8;
}

@end