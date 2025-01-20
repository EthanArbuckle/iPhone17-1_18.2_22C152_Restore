@interface HMCalendarEvent
+ (BOOL)supportsSecureCoding;
+ (id)createWithDictionary:(id)a3 home:(id)a4;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMCalendarEvent)initWithCoder:(id)a3;
- (HMCalendarEvent)initWithDict:(id)a3 fireDateComponents:(id)a4;
- (HMCalendarEvent)initWithFireDateComponents:(NSDateComponents *)fireDateComponents;
- (NSDateComponents)fireDateComponents;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_updateFromDictionary:(id)a3;
- (void)setFireDateComponents:(id)a3;
- (void)updateFireDateComponents:(id)a3 completionHandler:(id)a4;
@end

@implementation HMCalendarEvent

- (void).cxx_destruct
{
}

- (HMCalendarEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMCalendarEvent;
  v5 = [(HMEvent *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCalendarTimeEventFireDateComponents"];
    fireDateComponents = v5->_fireDateComponents;
    v5->_fireDateComponents = (NSDateComponents *)v6;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMMutableCalendarEvent alloc];
  v5 = [(HMCalendarEvent *)self fireDateComponents];
  uint64_t v6 = [(HMCalendarEvent *)v4 initWithFireDateComponents:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v4 = a3;
  v5 = [v4 dateComponentsForKey:@"kCalendarTimeEventFireDateComponents"];
  uint64_t v6 = [[HMCalendarEvent alloc] initWithDict:v4 fireDateComponents:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HMCalendarEvent alloc];
  v5 = [(HMCalendarEvent *)self fireDateComponents];
  uint64_t v6 = [(HMCalendarEvent *)v4 initWithFireDateComponents:v5];

  return v6;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMCalendarEvent;
  BOOL v5 = [(HMEvent *)&v14 mergeFromNewObject:v4];
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    objc_super v9 = [(HMCalendarEvent *)self fireDateComponents];
    v10 = [v8 fireDateComponents];
    char v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      v12 = [v8 fireDateComponents];
      [(HMCalendarEvent *)self setFireDateComponents:v12];

      BOOL v5 = 1;
    }
  }

  return v5;
}

- (void)_updateFromDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMCalendarEvent;
  id v4 = a3;
  [(HMEvent *)&v6 _updateFromDictionary:v4];
  BOOL v5 = objc_msgSend(v4, "dateComponentsFromDataForKey:", @"kCalendarTimeEventFireDateComponents", v6.receiver, v6.super_class);

  if (v5) {
    [(HMCalendarEvent *)self setFireDateComponents:v5];
  }
}

- (void)updateFireDateComponents:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  objc_super v6 = (char *)a3;
  v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMEvent *)self context];
  if (!v7)
  {
    uint64_t v25 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCalendarEvent updateFireDateComponents:completionHandler:]", @"completion"];
    v26 = (void *)MEMORY[0x19F3A64A0]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v29;
      __int16 v35 = 2112;
      v36 = (const char *)v25;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0];
    objc_exception_throw(v30);
  }
  objc_super v9 = (void *)v8;
  if (v8)
  {
    v10 = [(HMCalendarEvent *)self fireDateComponents];
    int v11 = [v10 isEqual:v6];

    if (v11)
    {
      v12 = (void *)MEMORY[0x19F3A64A0]();
      v13 = self;
      objc_super v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v34 = v15;
        __int16 v35 = 2112;
        v36 = v6;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Fire date is already %@", buf, 0x16u);
      }
      v16 = [v9 delegateCaller];
      [v16 callCompletion:v7 error:0];
    }
    else
    {
      uint64_t v21 = encodeRootObject(v6);
      if (v21)
      {
        v16 = (void *)v21;
        v31 = @"kCalendarTimeEventFireDateComponents";
        uint64_t v32 = v21;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        [(HMEvent *)self _updateEventWithPayload:v22 completionHandler:v7];
      }
      else
      {
        v23 = [v9 delegateCaller];
        v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        [v23 callCompletion:v7 error:v24];

        v16 = 0;
      }
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v20;
      __int16 v35 = 2080;
      v36 = "-[HMCalendarEvent updateFireDateComponents:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v16);
  }
}

- (id)_serializeForAdd
{
  v10.receiver = self;
  v10.super_class = (Class)HMCalendarEvent;
  v3 = [(HMEvent *)&v10 _serializeForAdd];
  id v4 = (void *)[v3 mutableCopy];

  BOOL v5 = (void *)MEMORY[0x1E4F28DB0];
  objc_super v6 = [(HMCalendarEvent *)self fireDateComponents];
  v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  [v4 setObject:v7 forKeyedSubscript:@"kCalendarTimeEventFireDateComponents"];

  uint64_t v8 = (void *)[v4 copy];

  return v8;
}

- (void)setFireDateComponents:(id)a3
{
  id v4 = (NSDateComponents *)a3;
  os_unfair_lock_lock_with_options();
  fireDateComponents = self->_fireDateComponents;
  self->_fireDateComponents = v4;

  os_unfair_lock_unlock(&self->super.super._lock);
}

- (NSDateComponents)fireDateComponents
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_fireDateComponents;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMCalendarEvent)initWithDict:(id)a3 fireDateComponents:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMCalendarEvent;
  v7 = [(HMEvent *)&v11 initWithDict:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    fireDateComponents = v7->_fireDateComponents;
    v7->_fireDateComponents = (NSDateComponents *)v8;
  }
  return v7;
}

- (HMCalendarEvent)initWithFireDateComponents:(NSDateComponents *)fireDateComponents
{
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_super v10 = @"kEventUUIDKey";
  id v4 = (void *)MEMORY[0x1E4F29128];
  BOOL v5 = fireDateComponents;
  id v6 = [v4 UUID];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [(HMCalendarEvent *)self initWithDict:v7 fireDateComponents:v5];

  return v8;
}

@end