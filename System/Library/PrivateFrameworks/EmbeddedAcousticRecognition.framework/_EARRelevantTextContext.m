@interface _EARRelevantTextContext
- (BOOL)abortCommandSuppression;
- (BOOL)cursorInVisibleText;
- (BOOL)disambiguationActive;
- (BOOL)favorCommandSuppression;
- (BOOL)getUndoEventAndReset;
- (BOOL)undoEvent;
- (_EARRelevantTextContext)init;
- (void)appendToLeftContext:(id)a3;
- (void)getLeftAndRightContextWithCompletion:(id)a3;
- (void)notifyUndoEventFromClient;
- (void)reset;
- (void)setAbortCommandSuppression:(BOOL)a3;
- (void)setCursorInVisibleText:(BOOL)a3;
- (void)setDisambiguationActive:(BOOL)a3;
- (void)setFavorCommandSuppression:(BOOL)a3;
- (void)setLeftContext:(id)a3;
- (void)setLeftContext:(id)a3 rightContext:(id)a4;
- (void)setRightContext:(id)a3;
- (void)setUndoEvent:(BOOL)a3;
@end

@implementation _EARRelevantTextContext

- (_EARRelevantTextContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)_EARRelevantTextContext;
  v2 = [(_EARRelevantTextContext *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [NSString string];
    leftContext = v2->_leftContext;
    v2->_leftContext = (NSString *)v3;

    uint64_t v5 = [NSString string];
    rightContext = v2->_rightContext;
    v2->_rightContext = (NSString *)v5;

    v2->_contextUpdateLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)setLeftContext:(id)a3
{
  id v3 = a3;
  if (v3) {
    objc_msgSend(v3, "ear_toString");
  }
  quasar::keepLastNCodePoints();
}

- (void)setRightContext:(id)a3
{
  id v3 = a3;
  if (v3) {
    objc_msgSend(v3, "ear_toString");
  }
  quasar::keepFirstNCodePoints();
}

- (void)setLeftContext:(id)a3 rightContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5) {
    objc_msgSend(v5, "ear_toString");
  }
  quasar::keepLastNCodePoints();
}

- (void)appendToLeftContext:(id)a3
{
  *(void *)&long long v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_contextUpdateLock = &self->_contextUpdateLock;
  os_unfair_lock_lock(&self->_contextUpdateLock);
  if (v4)
  {
    id v6 = NSString;
    leftContext = self->_leftContext;
    if (leftContext)
    {
      [(NSString *)leftContext ear_toString];
    }
    else
    {
      long long v16 = 0uLL;
      uint64_t v17 = 0;
    }
    objc_msgSend(v4, "ear_toString");
    memset(&v12, 0, sizeof(v12));
    v14 = &v12;
    char v15 = 0;
    v12.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x30uLL);
    v12.__r_.__value_.__l.__size_ = v12.__r_.__value_.__r.__words[0];
    v12.__r_.__value_.__r.__words[2] = v12.__r_.__value_.__r.__words[0] + 48;
    v12.__r_.__value_.__l.__size_ = (std::string::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v12.__r_.__value_.__r.__words[2], &v16, &v19, (std::string *)v12.__r_.__value_.__l.__data_);
    quasar::joinAndAutoSpace(&v12, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v9 = [v6 stringWithUTF8String:p_p];
    v10 = self->_leftContext;
    self->_leftContext = v9;

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    v14 = &v12;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
    for (uint64_t i = 0; i != -48; i -= 24)
    {
      if ((char)v18[i + 23] < 0) {
        operator delete(*(void **)&v18[i]);
      }
    }
  }
  os_unfair_lock_unlock(p_contextUpdateLock);
}

- (void)notifyUndoEventFromClient
{
  p_contextUpdateLock = &self->_contextUpdateLock;
  os_unfair_lock_lock(&self->_contextUpdateLock);
  self->_undoEvent = 1;
  os_unfair_lock_unlock(p_contextUpdateLock);
}

- (void)getLeftAndRightContextWithCompletion:(id)a3
{
  v7 = (void (**)(id, void *, void *))a3;
  p_contextUpdateLock = &self->_contextUpdateLock;
  os_unfair_lock_lock(&self->_contextUpdateLock);
  id v5 = (void *)[(NSString *)self->_leftContext copy];
  id v6 = (void *)[(NSString *)self->_rightContext copy];
  os_unfair_lock_unlock(p_contextUpdateLock);
  if (v7) {
    v7[2](v7, v5, v6);
  }
}

- (BOOL)getUndoEventAndReset
{
  p_contextUpdateLock = &self->_contextUpdateLock;
  os_unfair_lock_lock(&self->_contextUpdateLock);
  BOOL undoEvent = self->_undoEvent;
  self->_BOOL undoEvent = 0;
  os_unfair_lock_unlock(p_contextUpdateLock);
  return undoEvent;
}

- (void)reset
{
  p_contextUpdateLock = &self->_contextUpdateLock;
  os_unfair_lock_lock(&self->_contextUpdateLock);
  leftContext = self->_leftContext;
  self->_leftContext = (NSString *)&stru_1F0A64AB0;

  rightContext = self->_rightContext;
  self->_rightContext = (NSString *)&stru_1F0A64AB0;

  self->_BOOL undoEvent = 0;
  os_unfair_lock_unlock(p_contextUpdateLock);
  *(_DWORD *)&self->_disambiguationActive = 0;
}

- (BOOL)disambiguationActive
{
  return self->_disambiguationActive;
}

- (void)setDisambiguationActive:(BOOL)a3
{
  self->_disambiguationActive = a3;
}

- (BOOL)cursorInVisibleText
{
  return self->_cursorInVisibleText;
}

- (void)setCursorInVisibleText:(BOOL)a3
{
  self->_cursorInVisibleText = a3;
}

- (BOOL)favorCommandSuppression
{
  return self->_favorCommandSuppression;
}

- (void)setFavorCommandSuppression:(BOOL)a3
{
  self->_favorCommandSuppression = a3;
}

- (BOOL)abortCommandSuppression
{
  return self->_abortCommandSuppression;
}

- (void)setAbortCommandSuppression:(BOOL)a3
{
  self->_abortCommandSuppression = a3;
}

- (BOOL)undoEvent
{
  return self->_undoEvent;
}

- (void)setUndoEvent:(BOOL)a3
{
  self->_BOOL undoEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightContext, 0);
  objc_storeStrong((id *)&self->_leftContext, 0);
}

@end