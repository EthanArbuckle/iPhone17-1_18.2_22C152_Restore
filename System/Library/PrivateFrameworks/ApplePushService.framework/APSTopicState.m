@interface APSTopicState
- (APSConnectionServer)connectionServer;
- (APSTopicAttributes)attributes;
- (APSTopicState)initWithTopicName:(id)a3 connectionServer:(id)a4 attributes:(id)a5 topicHash:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSData)topicHash;
- (NSString)topicName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)currentFilter;
- (int64_t)desiredFilter;
- (void)setCurrentFilter:(int64_t)a3;
- (void)setDesiredFilter:(int64_t)a3;
@end

@implementation APSTopicState

- (APSTopicState)initWithTopicName:(id)a3 connectionServer:(id)a4 attributes:(id)a5 topicHash:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)APSTopicState;
  v15 = [(APSTopicState *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_topicName, a3);
    objc_storeStrong((id *)&v16->_topicHash, a6);
    objc_storeWeak((id *)&v16->_connectionServer, v12);
    objc_storeStrong((id *)&v16->_attributes, a5);
    v16->_currentFilter = 0;
    v16->_desiredFilter = 0;
  }

  return v16;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)APSTopicState;
  v3 = [(APSTopicState *)&v11 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionServer);
  long long v10 = *(_OWORD *)&self->_topicName;
  attributes = self->_attributes;
  v6 = sub_100067094(self->_currentFilter);
  v7 = sub_100067094(self->_desiredFilter);
  v8 = +[NSString stringWithFormat:@"%@ connectionServer=%@, topicName=%@, topicHash=%@, attributes=%@, currentFilter=%@, desiredFilter=%@", v3, WeakRetained, v10, attributes, v6, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(APSTopicState);
  objc_storeStrong((id *)&v4->_topicName, self->_topicName);
  objc_storeStrong((id *)&v4->_topicHash, self->_topicHash);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionServer);
  objc_storeWeak((id *)&v4->_connectionServer, WeakRetained);

  objc_storeStrong((id *)&v4->_attributes, self->_attributes);
  v4->_currentFilter = self->_currentFilter;
  v4->_desiredFilter = self->_desiredFilter;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (APSTopicState *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if (self == v4)
  {
    LOBYTE(v15) = 1;
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    v7 = [(APSTopicState *)v6 topicName];
    v8 = [(APSTopicState *)self topicName];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(APSTopicState *)v6 topicHash];
      long long v10 = [(APSTopicState *)self topicHash];
      if ([v9 isEqualToData:v10])
      {
        objc_super v11 = [(APSTopicState *)v6 connectionServer];
        id v12 = [(APSTopicState *)self connectionServer];
        if ([v11 isEqual:v12])
        {
          v29 = [(APSTopicState *)v6 attributes];
          id v13 = [v29 filter];
          v30 = [(APSTopicState *)self attributes];
          if (v13 == [v30 filter])
          {
            v28 = [(APSTopicState *)v6 attributes];
            unsigned int v14 = [v28 isDarkWakeEnabled];
            v27 = [(APSTopicState *)self attributes];
            if (v14 == [v27 isDarkWakeEnabled])
            {
              v26 = [(APSTopicState *)v6 attributes];
              unsigned int v17 = [v26 isPushWakeEnabled];
              v25 = [(APSTopicState *)self attributes];
              if (v17 == [v25 isPushWakeEnabled])
              {
                v24 = [(APSTopicState *)v6 attributes];
                unsigned int v18 = [v24 isCriticalWakeEnabled];
                v23 = [(APSTopicState *)self attributes];
                if (v18 == [v23 isCriticalWakeEnabled])
                {
                  v22 = [(APSTopicState *)v6 attributes];
                  unsigned int v21 = [v22 isUltraConstrainedEnabled];
                  v19 = [(APSTopicState *)self attributes];
                  unsigned int v15 = v21 ^ [v19 isUltraConstrainedEnabled] ^ 1;
                }
                else
                {
                  LOBYTE(v15) = 0;
                }
                v16 = v29;
              }
              else
              {
                LOBYTE(v15) = 0;
                v16 = v29;
              }
            }
            else
            {
              LOBYTE(v15) = 0;
              v16 = v29;
            }
          }
          else
          {
            LOBYTE(v15) = 0;
            v16 = v29;
          }
        }
        else
        {
          LOBYTE(v15) = 0;
        }
      }
      else
      {
        LOBYTE(v15) = 0;
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  else
  {
LABEL_10:
    LOBYTE(v15) = 0;
  }
LABEL_28:

  return v15;
}

- (APSConnectionServer)connectionServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionServer);
  return (APSConnectionServer *)WeakRetained;
}

- (NSString)topicName
{
  return self->_topicName;
}

- (NSData)topicHash
{
  return self->_topicHash;
}

- (APSTopicAttributes)attributes
{
  return self->_attributes;
}

- (int64_t)currentFilter
{
  return self->_currentFilter;
}

- (void)setCurrentFilter:(int64_t)a3
{
  self->_currentFilter = a3;
}

- (int64_t)desiredFilter
{
  return self->_desiredFilter;
}

- (void)setDesiredFilter:(int64_t)a3
{
  self->_desiredFilter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_topicHash, 0);
  objc_storeStrong((id *)&self->_topicName, 0);
  objc_destroyWeak((id *)&self->_connectionServer);
}

@end