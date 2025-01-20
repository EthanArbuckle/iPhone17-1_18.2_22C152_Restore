@interface BMPBContextualActionEvent
+ (Class)contentType;
+ (Class)parameterType;
- (BOOL)hasActionName;
- (BOOL)hasAppName;
- (BOOL)hasIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contents;
- (NSMutableArray)parameters;
- (NSString)actionName;
- (NSString)appName;
- (NSString)identifier;
- (id)contentAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)parameterAtIndex:(unint64_t)a3;
- (unint64_t)contentsCount;
- (unint64_t)hash;
- (unint64_t)parametersCount;
- (void)addContent:(id)a3;
- (void)addParameter:(id)a3;
- (void)clearContents;
- (void)clearParameters;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionName:(id)a3;
- (void)setAppName:(id)a3;
- (void)setContents:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setParameters:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBContextualActionEvent

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (BOOL)hasActionName
{
  return self->_actionName != 0;
}

- (void)clearContents
{
}

- (void)addContent:(id)a3
{
  id v4 = a3;
  contents = self->_contents;
  id v8 = v4;
  if (!contents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_contents;
    self->_contents = v6;

    id v4 = v8;
    contents = self->_contents;
  }
  [(NSMutableArray *)contents addObject:v4];
}

- (unint64_t)contentsCount
{
  return [(NSMutableArray *)self->_contents count];
}

- (id)contentAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contents objectAtIndex:a3];
}

+ (Class)contentType
{
  return (Class)objc_opt_class();
}

- (void)clearParameters
{
}

- (void)addParameter:(id)a3
{
  id v4 = a3;
  parameters = self->_parameters;
  id v8 = v4;
  if (!parameters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_parameters;
    self->_parameters = v6;

    id v4 = v8;
    parameters = self->_parameters;
  }
  [(NSMutableArray *)parameters addObject:v4];
}

- (unint64_t)parametersCount
{
  return [(NSMutableArray *)self->_parameters count];
}

- (id)parameterAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_parameters objectAtIndex:a3];
}

+ (Class)parameterType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBContextualActionEvent;
  id v4 = [(BMPBContextualActionEvent *)&v8 description];
  v5 = [(BMPBContextualActionEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  appName = self->_appName;
  if (appName) {
    [v4 setObject:appName forKey:@"appName"];
  }
  actionName = self->_actionName;
  if (actionName) {
    [v4 setObject:actionName forKey:@"actionName"];
  }
  contents = self->_contents;
  if (contents) {
    [v4 setObject:contents forKey:@"content"];
  }
  parameters = self->_parameters;
  if (parameters) {
    [v4 setObject:parameters forKey:@"parameter"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBContextualActionEventReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_appName) {
    PBDataWriterWriteStringField();
  }
  if (self->_actionName) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_contents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_parameters;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteDataField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_identifier) {
    objc_msgSend(v12, "setIdentifier:");
  }
  if (self->_appName) {
    objc_msgSend(v12, "setAppName:");
  }
  if (self->_actionName) {
    objc_msgSend(v12, "setActionName:");
  }
  if ([(BMPBContextualActionEvent *)self contentsCount])
  {
    [v12 clearContents];
    unint64_t v4 = [(BMPBContextualActionEvent *)self contentsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BMPBContextualActionEvent *)self contentAtIndex:i];
        [v12 addContent:v7];
      }
    }
  }
  if ([(BMPBContextualActionEvent *)self parametersCount])
  {
    [v12 clearParameters];
    unint64_t v8 = [(BMPBContextualActionEvent *)self parametersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(BMPBContextualActionEvent *)self parameterAtIndex:j];
        [v12 addParameter:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_appName copyWithZone:a3];
  unint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_actionName copyWithZone:a3];
  uint64_t v11 = (void *)v5[1];
  v5[1] = v10;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = self->_contents;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addContent:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v18 = self->_parameters;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (void)v25);
        [v5 addParameter:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[4]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((appName = self->_appName, !((unint64_t)appName | v4[2]))
     || -[NSString isEqual:](appName, "isEqual:"))
    && ((actionName = self->_actionName, !((unint64_t)actionName | v4[1]))
     || -[NSString isEqual:](actionName, "isEqual:"))
    && ((contents = self->_contents, !((unint64_t)contents | v4[3]))
     || -[NSMutableArray isEqual:](contents, "isEqual:")))
  {
    parameters = self->_parameters;
    if ((unint64_t)parameters | v4[5]) {
      char v10 = -[NSMutableArray isEqual:](parameters, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_appName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_actionName hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_contents hash];
  return v6 ^ [(NSMutableArray *)self->_parameters hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[BMPBContextualActionEvent setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)v4 + 2)) {
    -[BMPBContextualActionEvent setAppName:](self, "setAppName:");
  }
  if (*((void *)v4 + 1)) {
    -[BMPBContextualActionEvent setActionName:](self, "setActionName:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(BMPBContextualActionEvent *)self addContent:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 5);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[BMPBContextualActionEvent addParameter:](self, "addParameter:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
}

- (NSMutableArray)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
}

- (NSMutableArray)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_actionName, 0);
}

@end