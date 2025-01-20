@interface ADConfigurationRequest
+ (Class)currentConfigurationType;
+ (id)options;
- (BOOL)hasIAdID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)iAdID;
- (NSMutableArray)currentConfigurations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentConfigurationAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)currentConfigurationsCount;
- (unint64_t)hash;
- (void)addCurrentConfiguration:(id)a3;
- (void)clearCurrentConfigurations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentConfigurations:(id)a3;
- (void)setIAdID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADConfigurationRequest

+ (id)options
{
  if (options_once_7 != -1) {
    dispatch_once(&options_once_7, &__block_literal_global_12);
  }
  v2 = (void *)options_sOptions_7;
  return v2;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_currentConfigurations count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_currentConfigurations, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_currentConfigurations;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"currentConfiguration"];
  }
  iAdID = self->_iAdID;
  if (iAdID) {
    [v3 setObject:iAdID forKey:@"iAdID"];
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_currentConfigurations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_iAdID) {
    PBDataWriterWriteDataField();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_currentConfigurations, 0);
}

void __33__ADConfigurationRequest_options__block_invoke()
{
  v0 = (void *)options_sOptions_7;
  options_sOptions_7 = (uint64_t)&unk_1F2715550;
}

- (void)clearCurrentConfigurations
{
}

- (void)addCurrentConfiguration:(id)a3
{
  id v4 = a3;
  currentConfigurations = self->_currentConfigurations;
  id v8 = v4;
  if (!currentConfigurations)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_currentConfigurations;
    self->_currentConfigurations = v6;

    id v4 = v8;
    currentConfigurations = self->_currentConfigurations;
  }
  [(NSMutableArray *)currentConfigurations addObject:v4];
}

- (unint64_t)currentConfigurationsCount
{
  return [(NSMutableArray *)self->_currentConfigurations count];
}

- (id)currentConfigurationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_currentConfigurations objectAtIndex:a3];
}

+ (Class)currentConfigurationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADConfigurationRequest;
  id v4 = [(ADConfigurationRequest *)&v8 description];
  v5 = [(ADConfigurationRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return ADConfigurationRequestReadFrom(self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(ADConfigurationRequest *)self currentConfigurationsCount])
  {
    [v8 clearCurrentConfigurations];
    unint64_t v4 = [(ADConfigurationRequest *)self currentConfigurationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ADConfigurationRequest *)self currentConfigurationAtIndex:i];
        [v8 addCurrentConfiguration:v7];
      }
    }
  }
  if (self->_iAdID) {
    objc_msgSend(v8, "setIAdID:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_currentConfigurations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addCurrentConfiguration:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSData *)self->_iAdID copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((currentConfigurations = self->_currentConfigurations, !((unint64_t)currentConfigurations | v4[1]))
     || -[NSMutableArray isEqual:](currentConfigurations, "isEqual:")))
  {
    iAdID = self->_iAdID;
    if ((unint64_t)iAdID | v4[2]) {
      char v7 = -[NSData isEqual:](iAdID, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_currentConfigurations hash];
  return [(NSData *)self->_iAdID hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ADConfigurationRequest addCurrentConfiguration:](self, "addCurrentConfiguration:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[2]) {
    -[ADConfigurationRequest setIAdID:](self, "setIAdID:");
  }
}

- (NSMutableArray)currentConfigurations
{
  return self->_currentConfigurations;
}

- (void)setCurrentConfigurations:(id)a3
{
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
}

@end