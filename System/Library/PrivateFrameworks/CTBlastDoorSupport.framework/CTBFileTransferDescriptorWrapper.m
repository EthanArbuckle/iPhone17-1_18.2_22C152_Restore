@interface CTBFileTransferDescriptorWrapper
- (CTBFileTransferDescriptorWrapper)initWithWrapped:(optional<ctb:()basic_string<char :()std:(std::allocator<char>> *)a4 :char_traits<char> FileTransferDescriptor> *)a3;
- (id).cxx_construct;
- (optional<ctb::FileTransferDescriptor>)wrapped;
@end

@implementation CTBFileTransferDescriptorWrapper

- (CTBFileTransferDescriptorWrapper)initWithWrapped:(optional<ctb:()basic_string<char :()std:(std::allocator<char>> *)a4 :char_traits<char> FileTransferDescriptor> *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CTBFileTransferDescriptorWrapper;
  v5 = [(CTBFileTransferDescriptorWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    std::__optional_storage_base<ctb::FileTransferDescriptor,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::FileTransferDescriptor,false>>((uint64_t)&v5->_wrapped, (uint64_t)a3);
  }
  return v6;
}

- (optional<ctb::FileTransferDescriptor>)wrapped
{
  return (optional<ctb::FileTransferDescriptor> *)std::__optional_copy_base<ctb::FileTransferDescriptor,false>::__optional_copy_base[abi:ne180100]((ctb::FileTransferDescriptor::FileDescriptor *)retstr, (uint64_t)&self->_wrapped);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 304) = 0;
  return self;
}

@end