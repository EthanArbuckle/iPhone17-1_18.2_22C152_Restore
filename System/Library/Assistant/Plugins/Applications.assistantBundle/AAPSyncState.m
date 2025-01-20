@interface AAPSyncState
+ (BOOL)supportsSecureCoding;
- (AAPSyncAnchor)startAnchor;
- (AAPSyncAnchor)stopAnchor;
- (AAPSyncPrimitiveAnchor)keyAnchor;
- (AAPSyncState)initWithCoder:(id)a3;
- (AAPSyncState)initWithValidity:(id)a3 version:(int64_t)a4 keyAnchor:(id)a5 startAnchor:(id)a6 stopAnchor:(id)a7 apps:(id)a8 deletes:(id)a9;
- (BOOL)isEqual:(id)a3;
- (NSArray)deletes;
- (NSSet)apps;
- (NSString)validity;
- (id)description;
- (int64_t)version;
- (unint64_t)hash;
- (void)_validate;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AAPSyncState

- (AAPSyncState)initWithValidity:(id)a3 version:(int64_t)a4 keyAnchor:(id)a5 startAnchor:(id)a6 stopAnchor:(id)a7 apps:(id)a8 deletes:(id)a9
{
  v17.receiver = self;
  v17.super_class = (Class)AAPSyncState;
  v15 = [(AAPSyncState *)&v17 init];
  if (v15)
  {
    v15->_validity = (NSString *)[a3 copy];
    v15->_version = a4;
    v15->_keyAnchor = (AAPSyncPrimitiveAnchor *)[a5 copy];
    v15->_startAnchor = (AAPSyncAnchor *)[a6 copy];
    v15->_stopAnchor = (AAPSyncAnchor *)[a7 copy];
    v15->_apps = (NSSet *)[a8 copy];
    v15->_deletes = (NSArray *)[a9 copy];
    [(AAPSyncState *)v15 _validate];
  }
  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AAPSyncState;
  [(AAPSyncState *)&v3 dealloc];
}

- (void)_validate
{
  if (!self->_validity) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"AAPSyncState.m" lineNumber:82 description:@"validity cannot be nil"];
  }
  if (!self->_keyAnchor) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"AAPSyncState.m" lineNumber:83 description:@"keyAnchor cannot be nil"];
  }
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncState.m", 96, @"validity must be a %@", v3 object file lineNumber description];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncState.m", 97, @"keyAnchor must be a %@", v4 object file lineNumber description];
  }
  if (self->_startAnchor && (objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncState.m", 98, @"startAnchor must be a %@", v5 object file lineNumber description];
  }
  if (self->_stopAnchor && (objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncState.m", 99, @"stopAnchor must be a %@", v5 object file lineNumber description];
  }
  if (self->_apps && (objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncState.m", 100, @"apps must be a %@", v6 object file lineNumber description];
  }
  if (self->_deletes && (objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncState.m", 101, @"deletes must be a %@", v7 object file lineNumber description];
  }
  if (!self->_stopAnchor
    && (self->_startAnchor || [(NSSet *)self->_apps count] || [(NSArray *)self->_deletes count]))
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"AAPSyncState.m" lineNumber:104 description:@"there must be a stopAnchor unless there is no startAnchor and there are no apps and no deletes"];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  apps = self->_apps;
  v10 = (char *)[(NSSet *)apps countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(apps);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncState.m", 108, @"app must be a %@", v3 object file lineNumber description];
        }
      }
      v11 = (char *)[(NSSet *)apps countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v11);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  deletes = self->_deletes;
  v15 = (char *)[(NSArray *)deletes countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(deletes);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncState.m", 112, @"delete must be a %@", v8 object file lineNumber description];
        }
      }
      v16 = (char *)[(NSArray *)deletes countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAPSyncState)initWithCoder:(id)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v5, 0);
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
  id v19 = [a3 decodeObjectOfClass:v5 forKey:@"validity"];
  id v18 = [a3 decodeIntegerForKey:@"version"];
  id v11 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"keyAnchor"];
  id v12 = [a3 decodeObjectOfClass:v6 forKey:@"startAnchor"];
  id v13 = [a3 decodeObjectOfClass:v6 forKey:@"stopAnchor"];
  id v14 = [a3 decodeObjectOfClasses:v9 forKey:@"apps"];
  id v15 = [a3 decodeObjectOfClasses:v10 forKey:@"deletes"];
  if (self->_apps && (objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncState.m", 152, @"apps must be a %@", v7 object file lineNumber description];
  }
  if (self->_deletes && (objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncState.m", 153, @"deletes must be a %@", v8 object file lineNumber description];
  }
  return [(AAPSyncState *)self initWithValidity:v19 version:v18 keyAnchor:v11 startAnchor:v12 stopAnchor:v13 apps:v14 deletes:v15];
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_validity forKey:@"validity"];
  [a3 encodeInteger:self->_version forKey:@"version"];
  [a3 encodeObject:self->_keyAnchor forKey:@"keyAnchor"];
  [a3 encodeObject:self->_startAnchor forKey:@"startAnchor"];
  [a3 encodeObject:self->_stopAnchor forKey:@"stopAnchor"];
  [a3 encodeObject:self->_apps forKey:@"apps"];
  deletes = self->_deletes;

  [a3 encodeObject:deletes forKey:@"deletes"];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_validity hash];
  int64_t v4 = self->_version - v3 + 32 * v3;
  uint64_t v5 = (char *)[(AAPSyncAnchor *)self->_keyAnchor hash] + 32 * v4 - v4;
  int64_t v6 = (unsigned char *)[(AAPSyncAnchor *)self->_startAnchor hash] - v5 + 32 * (void)v5;
  int64_t v7 = [(AAPSyncAnchor *)self->_stopAnchor hash] + 32 * v6 - v6;
  int64_t v8 = (int64_t)[(NSSet *)self->_apps hash] + 32 * v7 - v7;
  return (unint64_t)[(NSArray *)self->_deletes hash] + 32 * v8 - v8 + 0x6CE5F3FACFLL;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v3 = self;
  if (self == a3)
  {
    LOBYTE(self) = self != 0;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class()) {
      goto LABEL_3;
    }
    LODWORD(self) = -[NSString isEqualToString:](v3->_validity, "isEqualToString:", [a3 validity]);
    if (!self) {
      return (char)self;
    }
    id version = (id)v3->_version;
    if (version == [a3 version])
    {
      LODWORD(self) = -[AAPSyncAnchor isEqualToAnchor:](v3->_keyAnchor, "isEqualToAnchor:", [a3 keyAnchor]);
      if (self)
      {
        LODWORD(self) = -[AAPSyncAnchor isEqualToAnchor:](v3->_startAnchor, "isEqualToAnchor:", [a3 startAnchor]);
        if (self)
        {
          LODWORD(self) = -[AAPSyncAnchor isEqualToAnchor:](v3->_stopAnchor, "isEqualToAnchor:", [a3 stopAnchor]);
          if (self)
          {
            LODWORD(self) = -[NSSet isEqualToSet:](v3->_apps, "isEqualToSet:", [a3 apps]);
            if (self)
            {
              deletes = v3->_deletes;
              id v8 = [a3 deletes];
              LOBYTE(self) = [(NSArray *)deletes isEqualToArray:v8];
            }
          }
        }
      }
    }
    else
    {
LABEL_3:
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@:%p validity='%@' version=%li anchors=(%@, %@]-%@> -> apps=%@ deletes=%@"), objc_opt_class(), self, self->_validity, self->_version, self->_startAnchor, self->_stopAnchor, self->_keyAnchor, self->_apps, self->_deletes;
}

- (NSString)validity
{
  return self->_validity;
}

- (int64_t)version
{
  return self->_version;
}

- (AAPSyncPrimitiveAnchor)keyAnchor
{
  return self->_keyAnchor;
}

- (AAPSyncAnchor)startAnchor
{
  return self->_startAnchor;
}

- (AAPSyncAnchor)stopAnchor
{
  return self->_stopAnchor;
}

- (NSSet)apps
{
  return self->_apps;
}

- (NSArray)deletes
{
  return self->_deletes;
}

@end