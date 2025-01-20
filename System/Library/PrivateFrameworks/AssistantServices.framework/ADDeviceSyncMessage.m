@interface ADDeviceSyncMessage
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullDeltaRequest)commandPullDeltaRequest;
- (ADDeviceSyncCommandPullDeltaResponse)commandPullDeltaResponse;
- (ADDeviceSyncCommandPullGenerationsRequest)commandPullGenerationsRequest;
- (ADDeviceSyncCommandPullGenerationsResponse)commandPullGenerationsResponse;
- (ADDeviceSyncCommandPullSnapshotRequest)commandPullSnapshotRequest;
- (ADDeviceSyncCommandPullSnapshotResponse)commandPullSnapshotResponse;
- (ADDeviceSyncCommandPushGenerationsRequest)commandPushGenerationsRequest;
- (ADDeviceSyncCommandPushGenerationsResponse)commandPushGenerationsResponse;
- (ADDeviceSyncMessage)init;
- (ADDeviceSyncMessage)initWithBuilder:(id)a3;
- (ADDeviceSyncMessage)initWithCoder:(id)a3;
- (ADDeviceSyncMessage)initWithSequence:(unint64_t)a3 type:(int64_t)a4 commandPushGenerationsRequest:(id)a5 commandPushGenerationsResponse:(id)a6 commandPullGenerationsRequest:(id)a7 commandPullGenerationsResponse:(id)a8 commandPullDeltaRequest:(id)a9 commandPullDeltaResponse:(id)a10 commandPullSnapshotRequest:(id)a11 commandPullSnapshotResponse:(id)a12;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)sequence;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandPullSnapshotResponse, 0);
  objc_storeStrong((id *)&self->_commandPullSnapshotRequest, 0);
  objc_storeStrong((id *)&self->_commandPullDeltaResponse, 0);
  objc_storeStrong((id *)&self->_commandPullDeltaRequest, 0);
  objc_storeStrong((id *)&self->_commandPullGenerationsResponse, 0);
  objc_storeStrong((id *)&self->_commandPullGenerationsRequest, 0);
  objc_storeStrong((id *)&self->_commandPushGenerationsResponse, 0);
  objc_storeStrong((id *)&self->_commandPushGenerationsRequest, 0);
}

- (ADDeviceSyncCommandPullSnapshotResponse)commandPullSnapshotResponse
{
  return self->_commandPullSnapshotResponse;
}

- (ADDeviceSyncCommandPullSnapshotRequest)commandPullSnapshotRequest
{
  return self->_commandPullSnapshotRequest;
}

- (ADDeviceSyncCommandPullDeltaResponse)commandPullDeltaResponse
{
  return self->_commandPullDeltaResponse;
}

- (ADDeviceSyncCommandPullDeltaRequest)commandPullDeltaRequest
{
  return self->_commandPullDeltaRequest;
}

- (ADDeviceSyncCommandPullGenerationsResponse)commandPullGenerationsResponse
{
  return self->_commandPullGenerationsResponse;
}

- (ADDeviceSyncCommandPullGenerationsRequest)commandPullGenerationsRequest
{
  return self->_commandPullGenerationsRequest;
}

- (ADDeviceSyncCommandPushGenerationsResponse)commandPushGenerationsResponse
{
  return self->_commandPushGenerationsResponse;
}

- (ADDeviceSyncCommandPushGenerationsRequest)commandPushGenerationsRequest
{
  return self->_commandPushGenerationsRequest;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)sequence
{
  return self->_sequence;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sequence = self->_sequence;
  id v7 = a3;
  v5 = +[NSNumber numberWithUnsignedLongLong:sequence];
  [v7 encodeObject:v5 forKey:@"ADDeviceSyncMessage::sequence"];

  v6 = +[NSNumber numberWithInteger:self->_type];
  [v7 encodeObject:v6 forKey:@"ADDeviceSyncMessage::type"];

  [v7 encodeObject:self->_commandPushGenerationsRequest forKey:@"ADDeviceSyncMessage::commandPushGenerationsRequest"];
  [v7 encodeObject:self->_commandPushGenerationsResponse forKey:@"ADDeviceSyncMessage::commandPushGenerationsResponse"];
  [v7 encodeObject:self->_commandPullGenerationsRequest forKey:@"ADDeviceSyncMessage::commandPullGenerationsRequest"];
  [v7 encodeObject:self->_commandPullGenerationsResponse forKey:@"ADDeviceSyncMessage::commandPullGenerationsResponse"];
  [v7 encodeObject:self->_commandPullDeltaRequest forKey:@"ADDeviceSyncMessage::commandPullDeltaRequest"];
  [v7 encodeObject:self->_commandPullDeltaResponse forKey:@"ADDeviceSyncMessage::commandPullDeltaResponse"];
  [v7 encodeObject:self->_commandPullSnapshotRequest forKey:@"ADDeviceSyncMessage::commandPullSnapshotRequest"];
  [v7 encodeObject:self->_commandPullSnapshotResponse forKey:@"ADDeviceSyncMessage::commandPullSnapshotResponse"];
}

- (ADDeviceSyncMessage)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncMessage::sequence"];
  id v17 = [v4 unsignedLongLongValue];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncMessage::type"];
  id v6 = [v5 integerValue];

  id v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncMessage::commandPushGenerationsRequest"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncMessage::commandPushGenerationsResponse"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncMessage::commandPullGenerationsRequest"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncMessage::commandPullGenerationsResponse"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncMessage::commandPullDeltaRequest"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncMessage::commandPullDeltaResponse"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncMessage::commandPullSnapshotRequest"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncMessage::commandPullSnapshotResponse"];

  v15 = [(ADDeviceSyncMessage *)self initWithSequence:v17 type:v6 commandPushGenerationsRequest:v7 commandPushGenerationsResponse:v8 commandPullGenerationsRequest:v9 commandPullGenerationsResponse:v10 commandPullDeltaRequest:v11 commandPullDeltaResponse:v12 commandPullSnapshotRequest:v13 commandPullSnapshotResponse:v14];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ADDeviceSyncMessage *)a3;
  if (self == v4)
  {
    BOOL v24 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id sequence = self->_sequence;
      if (sequence == (id)[(ADDeviceSyncMessage *)v5 sequence]
        && (id type = self->_type, type == (id)[(ADDeviceSyncMessage *)v5 type]))
      {
        v8 = [(ADDeviceSyncMessage *)v5 commandPushGenerationsRequest];
        commandPushGenerationsRequest = self->_commandPushGenerationsRequest;
        if (commandPushGenerationsRequest == v8
          || [(ADDeviceSyncCommandPushGenerationsRequest *)commandPushGenerationsRequest isEqual:v8])
        {
          v10 = [(ADDeviceSyncMessage *)v5 commandPushGenerationsResponse];
          commandPushGenerationsResponse = self->_commandPushGenerationsResponse;
          if (commandPushGenerationsResponse == v10
            || [(ADDeviceSyncCommandPushGenerationsResponse *)commandPushGenerationsResponse isEqual:v10])
          {
            v12 = [(ADDeviceSyncMessage *)v5 commandPullGenerationsRequest];
            commandPullGenerationsRequest = self->_commandPullGenerationsRequest;
            if (commandPullGenerationsRequest == v12
              || [(ADDeviceSyncCommandPullGenerationsRequest *)commandPullGenerationsRequest isEqual:v12])
            {
              v14 = [(ADDeviceSyncMessage *)v5 commandPullGenerationsResponse];
              commandPullGenerationsResponse = self->_commandPullGenerationsResponse;
              if (commandPullGenerationsResponse == v14
                || [(ADDeviceSyncCommandPullGenerationsResponse *)commandPullGenerationsResponse isEqual:v14])
              {
                v16 = [(ADDeviceSyncMessage *)v5 commandPullDeltaRequest];
                commandPullDeltaRequest = self->_commandPullDeltaRequest;
                if (commandPullDeltaRequest == v16
                  || [(ADDeviceSyncCommandPullDeltaRequest *)commandPullDeltaRequest isEqual:v16])
                {
                  v18 = [(ADDeviceSyncMessage *)v5 commandPullDeltaResponse];
                  commandPullDeltaResponse = self->_commandPullDeltaResponse;
                  if (commandPullDeltaResponse == v18
                    || [(ADDeviceSyncCommandPullDeltaResponse *)commandPullDeltaResponse isEqual:v18])
                  {
                    v20 = [(ADDeviceSyncMessage *)v5 commandPullSnapshotRequest];
                    commandPullSnapshotRequest = self->_commandPullSnapshotRequest;
                    if (commandPullSnapshotRequest == v20
                      || [(ADDeviceSyncCommandPullSnapshotRequest *)commandPullSnapshotRequest isEqual:v20])
                    {
                      v26 = v20;
                      v22 = [(ADDeviceSyncMessage *)v5 commandPullSnapshotResponse];
                      commandPullSnapshotResponse = self->_commandPullSnapshotResponse;
                      BOOL v24 = commandPullSnapshotResponse == v22
                         || [(ADDeviceSyncCommandPullSnapshotResponse *)commandPullSnapshotResponse isEqual:v22];

                      v20 = v26;
                    }
                    else
                    {
                      BOOL v24 = 0;
                    }
                  }
                  else
                  {
                    BOOL v24 = 0;
                  }
                }
                else
                {
                  BOOL v24 = 0;
                }
              }
              else
              {
                BOOL v24 = 0;
              }
            }
            else
            {
              BOOL v24 = 0;
            }
          }
          else
          {
            BOOL v24 = 0;
          }
        }
        else
        {
          BOOL v24 = 0;
        }
      }
      else
      {
        BOOL v24 = 0;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }

  return v24;
}

- (unint64_t)hash
{
  id v3 = +[NSNumber numberWithUnsignedLongLong:self->_sequence];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = +[NSNumber numberWithInteger:self->_type];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  unint64_t v7 = [(ADDeviceSyncCommandPushGenerationsRequest *)self->_commandPushGenerationsRequest hash];
  unint64_t v8 = v7 ^ [(ADDeviceSyncCommandPushGenerationsResponse *)self->_commandPushGenerationsResponse hash];
  unint64_t v9 = v8 ^ [(ADDeviceSyncCommandPullGenerationsRequest *)self->_commandPullGenerationsRequest hash];
  unint64_t v10 = v6 ^ v9 ^ [(ADDeviceSyncCommandPullGenerationsResponse *)self->_commandPullGenerationsResponse hash];
  unint64_t v11 = [(ADDeviceSyncCommandPullDeltaRequest *)self->_commandPullDeltaRequest hash];
  unint64_t v12 = v11 ^ [(ADDeviceSyncCommandPullDeltaResponse *)self->_commandPullDeltaResponse hash];
  unint64_t v13 = v12 ^ [(ADDeviceSyncCommandPullSnapshotRequest *)self->_commandPullSnapshotRequest hash];
  unint64_t v14 = v10 ^ v13 ^ [(ADDeviceSyncCommandPullSnapshotResponse *)self->_commandPullSnapshotResponse hash];

  return v14;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v12.receiver = self;
  v12.super_class = (Class)ADDeviceSyncMessage;
  v5 = [(ADDeviceSyncMessage *)&v12 description];
  unint64_t sequence = self->_sequence;
  unint64_t type = self->_type;
  if (type > 0xA) {
    unint64_t v8 = @"(unknown)";
  }
  else {
    unint64_t v8 = *(&off_10050AF88 + type);
  }
  unint64_t v9 = v8;
  v10 = [v4 initWithFormat:@"%@ {unint64_t sequence = %llu, type = %@, commandPushGenerationsRequest = %@, commandPushGenerationsResponse = %@, commandPullGenerationsRequest = %@, commandPullGenerationsResponse = %@, commandPullDeltaRequest = %@, commandPullDeltaResponse = %@, commandPullSnapshotRequest = %@, commandPullSnapshotResponse = %@}", v5, sequence, v9, self->_commandPushGenerationsRequest, self->_commandPushGenerationsResponse, self->_commandPullGenerationsRequest, self->_commandPullGenerationsResponse, self->_commandPullDeltaRequest, self->_commandPullDeltaResponse, self->_commandPullSnapshotRequest, self->_commandPullSnapshotResponse];

  return v10;
}

- (id)description
{
  return [(ADDeviceSyncMessage *)self _descriptionWithIndent:0];
}

- (ADDeviceSyncMessage)initWithSequence:(unint64_t)a3 type:(int64_t)a4 commandPushGenerationsRequest:(id)a5 commandPushGenerationsResponse:(id)a6 commandPullGenerationsRequest:(id)a7 commandPullGenerationsResponse:(id)a8 commandPullDeltaRequest:(id)a9 commandPullDeltaResponse:(id)a10 commandPullSnapshotRequest:(id)a11 commandPullSnapshotResponse:(id)a12
{
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100066E68;
  v26[3] = &unk_1004FF7D0;
  unint64_t v35 = a3;
  int64_t v36 = a4;
  id v27 = a5;
  id v28 = a6;
  id v29 = a7;
  id v30 = a8;
  id v31 = a9;
  id v32 = a10;
  id v33 = a11;
  id v34 = a12;
  id v15 = v34;
  id v16 = v33;
  id v17 = v32;
  id v18 = v31;
  id v19 = v30;
  id v20 = v29;
  id v21 = v28;
  id v22 = v27;
  v23 = [(ADDeviceSyncMessage *)self initWithBuilder:v26];

  return v23;
}

- (ADDeviceSyncMessage)init
{
  return [(ADDeviceSyncMessage *)self initWithBuilder:0];
}

- (ADDeviceSyncMessage)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncMessageMutation *))a3;
  v33.receiver = self;
  v33.super_class = (Class)ADDeviceSyncMessage;
  v5 = [(ADDeviceSyncMessage *)&v33 init];
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_ADDeviceSyncMessageMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADDeviceSyncMessageMutation *)v7 isDirty])
    {
      v6->_unint64_t sequence = [(_ADDeviceSyncMessageMutation *)v7 getSequence];
      v6->_unint64_t type = [(_ADDeviceSyncMessageMutation *)v7 getType];
      unint64_t v8 = [(_ADDeviceSyncMessageMutation *)v7 getCommandPushGenerationsRequest];
      unint64_t v9 = (ADDeviceSyncCommandPushGenerationsRequest *)[v8 copy];
      commandPushGenerationsRequest = v6->_commandPushGenerationsRequest;
      v6->_commandPushGenerationsRequest = v9;

      unint64_t v11 = [(_ADDeviceSyncMessageMutation *)v7 getCommandPushGenerationsResponse];
      objc_super v12 = (ADDeviceSyncCommandPushGenerationsResponse *)[v11 copy];
      commandPushGenerationsResponse = v6->_commandPushGenerationsResponse;
      v6->_commandPushGenerationsResponse = v12;

      unint64_t v14 = [(_ADDeviceSyncMessageMutation *)v7 getCommandPullGenerationsRequest];
      id v15 = (ADDeviceSyncCommandPullGenerationsRequest *)[v14 copy];
      commandPullGenerationsRequest = v6->_commandPullGenerationsRequest;
      v6->_commandPullGenerationsRequest = v15;

      id v17 = [(_ADDeviceSyncMessageMutation *)v7 getCommandPullGenerationsResponse];
      id v18 = (ADDeviceSyncCommandPullGenerationsResponse *)[v17 copy];
      commandPullGenerationsResponse = v6->_commandPullGenerationsResponse;
      v6->_commandPullGenerationsResponse = v18;

      id v20 = [(_ADDeviceSyncMessageMutation *)v7 getCommandPullDeltaRequest];
      id v21 = (ADDeviceSyncCommandPullDeltaRequest *)[v20 copy];
      commandPullDeltaRequest = v6->_commandPullDeltaRequest;
      v6->_commandPullDeltaRequest = v21;

      v23 = [(_ADDeviceSyncMessageMutation *)v7 getCommandPullDeltaResponse];
      BOOL v24 = (ADDeviceSyncCommandPullDeltaResponse *)[v23 copy];
      commandPullDeltaResponse = v6->_commandPullDeltaResponse;
      v6->_commandPullDeltaResponse = v24;

      v26 = [(_ADDeviceSyncMessageMutation *)v7 getCommandPullSnapshotRequest];
      id v27 = (ADDeviceSyncCommandPullSnapshotRequest *)[v26 copy];
      commandPullSnapshotRequest = v6->_commandPullSnapshotRequest;
      v6->_commandPullSnapshotRequest = v27;

      id v29 = [(_ADDeviceSyncMessageMutation *)v7 getCommandPullSnapshotResponse];
      id v30 = (ADDeviceSyncCommandPullSnapshotResponse *)[v29 copy];
      commandPullSnapshotResponse = v6->_commandPullSnapshotResponse;
      v6->_commandPullSnapshotResponse = v30;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncMessageMutation *))a3;
  if (v4)
  {
    v5 = [[_ADDeviceSyncMessageMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceSyncMessageMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(ADDeviceSyncMessage);
      v6->_unint64_t sequence = [(_ADDeviceSyncMessageMutation *)v5 getSequence];
      v6->_unint64_t type = [(_ADDeviceSyncMessageMutation *)v5 getType];
      unint64_t v7 = [(_ADDeviceSyncMessageMutation *)v5 getCommandPushGenerationsRequest];
      unint64_t v8 = (ADDeviceSyncCommandPushGenerationsRequest *)[v7 copy];
      commandPushGenerationsRequest = v6->_commandPushGenerationsRequest;
      v6->_commandPushGenerationsRequest = v8;

      id v10 = [(_ADDeviceSyncMessageMutation *)v5 getCommandPushGenerationsResponse];
      unint64_t v11 = (ADDeviceSyncCommandPushGenerationsResponse *)[v10 copy];
      commandPushGenerationsResponse = v6->_commandPushGenerationsResponse;
      v6->_commandPushGenerationsResponse = v11;

      unint64_t v13 = [(_ADDeviceSyncMessageMutation *)v5 getCommandPullGenerationsRequest];
      unint64_t v14 = (ADDeviceSyncCommandPullGenerationsRequest *)[v13 copy];
      commandPullGenerationsRequest = v6->_commandPullGenerationsRequest;
      v6->_commandPullGenerationsRequest = v14;

      id v16 = [(_ADDeviceSyncMessageMutation *)v5 getCommandPullGenerationsResponse];
      id v17 = (ADDeviceSyncCommandPullGenerationsResponse *)[v16 copy];
      commandPullGenerationsResponse = v6->_commandPullGenerationsResponse;
      v6->_commandPullGenerationsResponse = v17;

      id v19 = [(_ADDeviceSyncMessageMutation *)v5 getCommandPullDeltaRequest];
      id v20 = (ADDeviceSyncCommandPullDeltaRequest *)[v19 copy];
      commandPullDeltaRequest = v6->_commandPullDeltaRequest;
      v6->_commandPullDeltaRequest = v20;

      id v22 = [(_ADDeviceSyncMessageMutation *)v5 getCommandPullDeltaResponse];
      v23 = (ADDeviceSyncCommandPullDeltaResponse *)[v22 copy];
      commandPullDeltaResponse = v6->_commandPullDeltaResponse;
      v6->_commandPullDeltaResponse = v23;

      v25 = [(_ADDeviceSyncMessageMutation *)v5 getCommandPullSnapshotRequest];
      v26 = (ADDeviceSyncCommandPullSnapshotRequest *)[v25 copy];
      commandPullSnapshotRequest = v6->_commandPullSnapshotRequest;
      v6->_commandPullSnapshotRequest = v26;

      id v28 = [(_ADDeviceSyncMessageMutation *)v5 getCommandPullSnapshotResponse];
      id v29 = (ADDeviceSyncCommandPullSnapshotResponse *)[v28 copy];
      commandPullSnapshotResponse = v6->_commandPullSnapshotResponse;
      v6->_commandPullSnapshotResponse = v29;
    }
    else
    {
      unint64_t v6 = (ADDeviceSyncMessage *)[(ADDeviceSyncMessage *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (ADDeviceSyncMessage *)[(ADDeviceSyncMessage *)self copy];
  }

  return v6;
}

@end