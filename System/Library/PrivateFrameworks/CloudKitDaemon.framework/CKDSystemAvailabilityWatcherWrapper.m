@interface CKDSystemAvailabilityWatcherWrapper
- (BOOL)isEqual:(id)a3;
- (CKDSystemAvailabilityWatcher)delegate;
- (CKDSystemAvailabilityWatcherWrapper)initWithDelegate:(id)a3;
- (NSString)personaID;
- (id)description;
- (unint64_t)hash;
- (unint64_t)savedDelegateHash;
- (void)postSystemAvailabilityChanged:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPersonaID:(id)a3;
- (void)setSavedDelegateHash:(unint64_t)a3;
@end

@implementation CKDSystemAvailabilityWatcherWrapper

- (CKDSystemAvailabilityWatcherWrapper)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKDSystemAvailabilityWatcherWrapper;
  v5 = [(CKDSystemAvailabilityWatcherWrapper *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = CKCurrentPersonaID();
    personaID = v6->_personaID;
    v6->_personaID = (NSString *)v7;

    v6->_savedDelegateHash = objc_msgSend_hash(v4, v9, v10);
  }

  return v6;
}

- (void)postSystemAvailabilityChanged:(unint64_t)a3
{
  objc_msgSend_delegate(self, a2, a3);
  v5 = (const char *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = (char *)v5;
    uint64_t v7 = objc_msgSend_personaID(self, v5, v6);
    BOOL v8 = CKAdoptPersonaID(v7);

    if (v8 && (objc_msgSend_systemAvailabilityChanged_(v9, v9, a3) & 1) == 0) {
      objc_msgSend_setDelegate_(self, v9, 0);
    }
  }
  MEMORY[0x1F41817F8]();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9 = objc_msgSend_delegate(self, v5, v6);
  if (v9)
  {
    uint64_t v10 = objc_msgSend_delegate(v4, v7, v8);
    BOOL v11 = v9 == v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_savedDelegateHash;
}

- (id)description
{
  v3 = objc_msgSend_delegate(self, a2, v2);
  id v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v8 = (void *)v6;
  if (v3)
  {
    v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    objc_super v12 = objc_msgSend_stringWithFormat_(v4, v11, @"%@: <%@: %p>", v8, v10, v3);
  }
  else
  {
    objc_super v12 = objc_msgSend_stringWithFormat_(v4, v7, @"%@: <Watcher deallocated>", v6);
  }

  return v12;
}

- (CKDSystemAvailabilityWatcher)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CKDSystemAvailabilityWatcher *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)savedDelegateHash
{
  return self->_savedDelegateHash;
}

- (void)setSavedDelegateHash:(unint64_t)a3
{
  self->_savedDelegateHash = a3;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end