@interface _IKJSDataObserverRecord
+ (id)hashForObserver:(id)a3;
- (BOOL)isAffectedByPropertyPathWithString:(id)a3 subpathString:(id *)a4;
- (IKJSDataObserving)observer;
- (NSString)observerHash;
- (NSString)pathString;
- (_IKJSDataObserverRecord)initWithObserver:(id)a3 pathString:(id)a4;
@end

@implementation _IKJSDataObserverRecord

+ (id)hashForObserver:(id)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", a3);
}

- (_IKJSDataObserverRecord)initWithObserver:(id)a3 pathString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_IKJSDataObserverRecord;
  v8 = [(_IKJSDataObserverRecord *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    uint64_t v10 = [(id)objc_opt_class() hashForObserver:v6];
    observerHash = v9->_observerHash;
    v9->_observerHash = (NSString *)v10;

    uint64_t v12 = [v7 copy];
    pathString = v9->_pathString;
    v9->_pathString = (NSString *)v12;

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_observer);
    v9->_observerFlags.hasDidChangePropertyPath = objc_opt_respondsToSelector() & 1;
  }
  return v9;
}

- (BOOL)isAffectedByPropertyPathWithString:(id)a3 subpathString:(id *)a4
{
  id v6 = a3;
  id v7 = [(_IKJSDataObserverRecord *)self observer];
  if (v7)
  {
    BOOL hasDidChangePropertyPath = self->_observerFlags.hasDidChangePropertyPath;

    if (hasDidChangePropertyPath)
    {
      v9 = [(_IKJSDataObserverRecord *)self pathString];
      id v10 = v6;
      if ([v9 length])
      {
        if ([v10 rangeOfString:v9])
        {
          uint64_t v12 = 0;
          BOOL v13 = [v9 rangeOfString:v10] == 0;
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
      uint64_t v12 = [v10 substringFromIndex:v11];
      BOOL v13 = 1;
LABEL_11:

      if (!a4) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  uint64_t v12 = 0;
  BOOL v13 = 0;
  if (a4) {
LABEL_7:
  }
    *a4 = v12;
LABEL_8:

  return v13;
}

- (IKJSDataObserving)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (IKJSDataObserving *)WeakRetained;
}

- (NSString)observerHash
{
  return self->_observerHash;
}

- (NSString)pathString
{
  return self->_pathString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathString, 0);
  objc_storeStrong((id *)&self->_observerHash, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end