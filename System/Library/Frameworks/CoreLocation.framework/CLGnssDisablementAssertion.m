@interface CLGnssDisablementAssertion
+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (CLGnssDisablementAssertion)initWithRegistrationMessageName:(const char *)a3 messagePayload:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (id).cxx_construct;
- (void)dealloc;
- (void)invalidate;
@end

@implementation CLGnssDisablementAssertion

- (CLGnssDisablementAssertion)initWithRegistrationMessageName:(const char *)a3 messagePayload:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CLGnssDisablementAssertion;
  if ([(CLGnssDisablementAssertion *)&v7 init]) {
    operator new();
  }
  return 0;
}

- (void)invalidate
{
  value = self->fInternal.__ptr_.__value_;
  if (value) {
    sub_1907142A8((uint64_t)value);
  }
}

- (void)dealloc
{
  p_fInternal = (uint64_t *)&self->fInternal;
  sub_190736824((uint64_t *)&self->fInternal, 0);
  sub_190736824(p_fInternal, 0);
  v4.receiver = self;
  v4.super_class = (Class)CLGnssDisablementAssertion;
  [(CLGnssDisablementAssertion *)&v4 dealloc];
}

+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE006300);
  }
  v10 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEBUG, "#clgda,client,newAssertionForBundleIdentifier", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006300);
    }
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLGnssDisablementAssertion newAssertionForBundleIdentifier:withReason:callbackQueue:completionHandler:]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  return sub_190736A28((uint64_t)(id)[a3 copy], (uint64_t)&stru_1EE006720, (uint64_t)(id)objc_msgSend(a4, "copy"), (uint64_t)a5, (uint64_t)a6);
}

+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE006300);
  }
  v10 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEBUG, "#clgda,client,newAssertionForBundle", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE006300);
    }
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLGnssDisablementAssertion newAssertionForBundle:withReason:callbackQueue:completionHandler:]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  return sub_190736A28((uint64_t)&stru_1EE006720, (uint64_t)(id)objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "copy"), (uint64_t)(id)objc_msgSend(a4, "copy"), (uint64_t)a5, (uint64_t)a6);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end