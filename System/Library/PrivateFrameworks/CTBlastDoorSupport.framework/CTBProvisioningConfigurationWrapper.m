@interface CTBProvisioningConfigurationWrapper
- (CTBProvisioningConfigurationWrapper)initWithWrapped:(optional<ctb:()set<std:()std:(std:()set<std:()std:(std:()basic_string<char :()std:(std::allocator<char>> *)a6 :char_traits<char> allocator<std::string>> *)a5 :less<std::string> :string :allocator<std::string>> *)a4 :less<std::string> :string :ProvisioningConfiguration> *)a3;
- (id).cxx_construct;
- (optional<ctb::ProvisioningConfiguration>)wrapped;
@end

@implementation CTBProvisioningConfigurationWrapper

- (CTBProvisioningConfigurationWrapper)initWithWrapped:(optional<ctb:()set<std:()std:(std:()set<std:()std:(std:()basic_string<char :()std:(std::allocator<char>> *)a6 :char_traits<char> allocator<std::string>> *)a5 :less<std::string> :string :allocator<std::string>> *)a4 :less<std::string> :string :ProvisioningConfiguration> *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTBProvisioningConfigurationWrapper;
  v7 = [(CTBProvisioningConfigurationWrapper *)&v10 init];
  v8 = v7;
  if (v7) {
    std::__optional_storage_base<ctb::ProvisioningConfiguration,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<ctb::ProvisioningConfiguration,false>>((uint64_t)&v7->_wrapped, (uint64_t)a3);
  }
  return v8;
}

- (optional<ctb::ProvisioningConfiguration>)wrapped
{
  return (optional<ctb::ProvisioningConfiguration> *)std::__optional_copy_base<ctb::ProvisioningConfiguration,false>::__optional_copy_base[abi:ne180100]((ctb::ProvisioningConfiguration *)retstr, (const ctb::ProvisioningConfiguration *)&self->_wrapped);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 1192) = 0;
  return self;
}

@end