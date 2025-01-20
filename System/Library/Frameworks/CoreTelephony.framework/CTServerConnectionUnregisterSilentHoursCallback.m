@interface CTServerConnectionUnregisterSilentHoursCallback
@end

@implementation CTServerConnectionUnregisterSilentHoursCallback

void ___CTServerConnectionUnregisterSilentHoursCallback_block_invoke(uint64_t a1)
{
  v1 = (uint64_t **)(*(void *)(a1 + 32) + 56);
  std::string::basic_string[abi:nn180100]<0>(__p, "kIncomingCallCheckMessageRequest");
  std::__tree<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::block<void({block_pointer})(xpc::dict)>>>>::__erase_unique<std::string>(v1, __p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
}

@end