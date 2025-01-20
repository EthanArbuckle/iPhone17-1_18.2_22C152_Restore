@interface CLFindMyAccessoryFragmentAccumulator
+ (id)convertDataStatusToString:(unint64_t)a3;
- (BOOL)appendData:(id)a3 forUUID:(id)a4;
- (BOOL)clearForUUID:(id)a3;
- (CLFindMyAccessoryFragmentAccumulator)initWithMaxBytesPerUUID:(unint64_t)a3;
- (NSMutableDictionary)uuidToData;
- (id)dataForUUID:(id)a3;
- (unint64_t)getDataStatusForUUID:(id)a3;
- (unint64_t)maxBytesPerUUID;
- (void)dealloc;
- (void)setMaxBytesPerUUID:(unint64_t)a3;
- (void)setUuidToData:(id)a3;
@end

@implementation CLFindMyAccessoryFragmentAccumulator

- (unint64_t)getDataStatusForUUID:(id)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t result = -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToData, "objectForKeyedSubscript:");
  if (result)
  {
    if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToData, "objectForKeyedSubscript:", a3), "length") < self->_maxBytesPerUUID)return 1; {
    else
    }
      return 2;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessoryFragmentAccumulator;
  [(CLFindMyAccessoryFragmentAccumulator *)&v3 dealloc];
}

- (CLFindMyAccessoryFragmentAccumulator)initWithMaxBytesPerUUID:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLFindMyAccessoryFragmentAccumulator;
  v4 = [(CLFindMyAccessoryFragmentAccumulator *)&v6 init];
  if (v4)
  {
    v4->_uuidToData = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_maxBytesPerUUID = a3;
  }
  return v4;
}

- (BOOL)clearForUUID:(id)a3
{
  if (a3) {
    [(NSMutableDictionary *)self->_uuidToData removeObjectForKey:a3];
  }
  return a3 != 0;
}

- (BOOL)appendData:(id)a3 forUUID:(id)a4
{
  if (a3) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = !v4;
  if (!v4)
  {
    id v7 = a3;
    if (![(NSMutableDictionary *)self->_uuidToData objectForKeyedSubscript:a4]) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uuidToData, "setObject:forKeyedSubscript:", [MEMORY[0x1E4F1CA58] data], a4);
    }
    if ([v7 length] >= self->_maxBytesPerUUID)
    {
      id v7 = (id)objc_msgSend(v7, "subdataWithRange:", objc_msgSend(v7, "length") - self->_maxBytesPerUUID);
      uint64_t v14 = [MEMORY[0x1E4F1CA58] data];
    }
    else
    {
      uint64_t v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToData, "objectForKeyedSubscript:", a4), "length");
      int64_t v10 = [v7 length] + v9;
      int64_t maxBytesPerUUID = self->_maxBytesPerUUID;
      if (v10 <= maxBytesPerUUID)
      {
LABEL_15:
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToData, "objectForKeyedSubscript:", a4), "appendData:", v7);
        return v5;
      }
      int64_t v12 = maxBytesPerUUID - [v7 length];
      uint64_t v13 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToData, "objectForKeyedSubscript:", a4), "subdataWithRange:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToData, "objectForKeyedSubscript:", a4), "length")- v12, v12);
      uint64_t v14 = [MEMORY[0x1E4F1CA58] dataWithData:v13];
    }
    [(NSMutableDictionary *)self->_uuidToData setObject:v14 forKeyedSubscript:a4];
    goto LABEL_15;
  }
  return v5;
}

- (id)dataForUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_uuidToData objectForKeyedSubscript:a3];
}

+ (id)convertDataStatusToString:(unint64_t)a3
{
  objc_super v3 = @"Data does not exist";
  if (a3 == 1) {
    objc_super v3 = @"Data is valid";
  }
  if (a3 == 2) {
    return @"Data exceeded maximum buffer size";
  }
  else {
    return v3;
  }
}

- (NSMutableDictionary)uuidToData
{
  return self->_uuidToData;
}

- (void)setUuidToData:(id)a3
{
  self->_uuidToData = (NSMutableDictionary *)a3;
}

- (unint64_t)maxBytesPerUUID
{
  return self->_maxBytesPerUUID;
}

- (void)setMaxBytesPerUUID:(unint64_t)a3
{
  self->_int64_t maxBytesPerUUID = a3;
}

@end