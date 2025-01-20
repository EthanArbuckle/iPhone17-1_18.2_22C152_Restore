@interface DYCaptureState
- (BOOL)allDataReceivedAck;
- (id).cxx_construct;
- (unint64_t)capturedFrames;
- (unordered_map<const)dispatchQueueLabelMap;
- (unordered_map<unsigned)threadLabelMap;
- (void)setAllDataReceivedAck:(BOOL)a3;
- (void)setCapturedFrames:(unint64_t)a3;
@end

@implementation DYCaptureState

- (unint64_t)capturedFrames
{
  return self->_capturedFrames;
}

- (void)setCapturedFrames:(unint64_t)a3
{
  self->_capturedFrames = a3;
}

- (BOOL)allDataReceivedAck
{
  return self->_allDataReceivedAck;
}

- (void)setAllDataReceivedAck:(BOOL)a3
{
  self->_allDataReceivedAck = a3;
}

- (unordered_map<const)dispatchQueueLabelMap
{
  return (unordered_map<const void *, std::string, std::hash<const void *>, std::equal_to<const void *>, std::allocator<std::pair<const void *const, std::string>>> *)std::unordered_map<void const*,std::string>::unordered_map((uint64_t)retstr, (uint64_t)&self->_dispatchQueueLabelMap);
}

- (unordered_map<unsigned)threadLabelMap
{
  return (unordered_map<unsigned long long, std::string, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::string>>> *)std::unordered_map<unsigned long long,std::string>::unordered_map((uint64_t)retstr, (uint64_t)&self->_threadLabelMap);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::~__hash_table((uint64_t)&self->_threadLabelMap);

  std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::~__hash_table((uint64_t)&self->_dispatchQueueLabelMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  return self;
}

@end