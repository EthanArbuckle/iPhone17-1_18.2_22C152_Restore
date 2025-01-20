@interface __CFN_CoalescingDomainHolder
- (__CFN_CoalescingDomainHolder)init;
- (id).cxx_construct;
- (void)coalescingCoalescingConnectionHost:(void *)a3 ipAddrs:(void *)a4;
- (void)dealloc;
@end

@implementation __CFN_CoalescingDomainHolder

- (__CFN_CoalescingDomainHolder)init
{
  v4.receiver = self;
  v4.super_class = (Class)__CFN_CoalescingDomainHolder;
  v2 = [(__CFN_CoalescingDomainHolder *)&v4 init];
  if (v2) {
    v2->_pathPolicyManager = objc_alloc_init(__CFN_PathPolicyManager);
  }
  return v2;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = (char *)self + 40;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = (char *)self + 64;
  *((void *)self + 11) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = (char *)self + 88;
  *((void *)self + 15) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = (char *)self + 112;
  return self;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::shared_ptr<__CoalescingConnectionKey>,std::set<std::string>>,std::__map_value_compare<std::shared_ptr<__CoalescingConnectionKey>,std::__value_type<std::shared_ptr<__CoalescingConnectionKey>,std::set<std::string>>,CoalescingConnectionKeyComparator,true>,std::allocator<std::__value_type<std::shared_ptr<__CoalescingConnectionKey>,std::set<std::string>>>>::destroy((void *)self->_coalescingDomain._connectionKeyToAllRequestHosts.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,std::shared_ptr<__CoalescingConnectionKey>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<__CoalescingConnectionKey>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<__CoalescingConnectionKey>>>>::destroy((void *)self->_coalescingDomain._requestHostToConnectionKey.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::shared_ptr<__CoalescingConnectionKey>,std::set<std::string>>,std::__map_value_compare<std::shared_ptr<__CoalescingConnectionKey>,std::__value_type<std::shared_ptr<__CoalescingConnectionKey>,std::set<std::string>>,CoalescingConnectionKeyComparator,true>,std::allocator<std::__value_type<std::shared_ptr<__CoalescingConnectionKey>,std::set<std::string>>>>::destroy((void *)self->_coalescingDomain._connectionKeyToAllIPAddresses.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,std::set<std::shared_ptr<__CoalescingConnectionKey>,CoalescingConnectionKeyComparator,std::allocator<std::shared_ptr<__CoalescingConnectionKey>>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::set<std::shared_ptr<__CoalescingConnectionKey>,CoalescingConnectionKeyComparator,std::allocator<std::shared_ptr<__CoalescingConnectionKey>>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::set<std::shared_ptr<__CoalescingConnectionKey>,CoalescingConnectionKeyComparator,std::allocator<std::shared_ptr<__CoalescingConnectionKey>>>>>>::destroy((void *)self->_coalescingDomain._ipAddressToConnectionKey.__tree_.__pair1_.__value_.__left_);
  left = self->_coalescingDomain._DNS.__tree_.__pair1_.__value_.__left_;

  std::__tree<std::__value_type<std::string,std::vector<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::string>>>>::destroy(left);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)__CFN_CoalescingDomainHolder;
  [(__CFN_CoalescingDomainHolder *)&v3 dealloc];
}

- (void)coalescingCoalescingConnectionHost:(void *)a3 ipAddrs:(void *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = a2;
  if (a2)
  {
    int64x2_t v33 = 0uLL;
    v34 = 0;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v5 = [a4 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v30 != v6) {
            objc_enumerationMutation(a4);
          }
          std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "UTF8String", v23));
          v8 = (_OWORD *)v33.i64[1];
          if (v33.i64[1] >= (unint64_t)v34)
          {
            unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v33.i64[1] - v33.i64[0]) >> 3);
            unint64_t v11 = v10 + 1;
            if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            if (0x5555555555555556 * (((uint64_t)v34 - v33.i64[0]) >> 3) > v11) {
              unint64_t v11 = 0x5555555555555556 * (((uint64_t)v34 - v33.i64[0]) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v34 - v33.i64[0]) >> 3) >= 0x555555555555555) {
              unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v12 = v11;
            }
            v35.__end_cap_.__value_ = (std::allocator<std::string> *)&v34;
            if (v12) {
              unint64_t v12 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v12);
            }
            else {
              uint64_t v13 = 0;
            }
            unint64_t v14 = v12 + 24 * v10;
            long long v15 = *(_OWORD *)__p;
            *(void *)(v14 + 16) = v28;
            *(_OWORD *)unint64_t v14 = v15;
            __p[1] = 0;
            uint64_t v28 = 0;
            __p[0] = 0;
            uint64_t v16 = v33.i64[1];
            uint64_t v17 = v33.i64[0];
            if (v33.i64[1] == v33.i64[0])
            {
              int64x2_t v20 = vdupq_n_s64(v33.u64[1]);
              unint64_t v18 = v12 + 24 * v10;
            }
            else
            {
              unint64_t v18 = v12 + 24 * v10;
              do
              {
                long long v19 = *(_OWORD *)(v16 - 24);
                *(void *)(v18 - 8) = *(void *)(v16 - 8);
                *(_OWORD *)(v18 - 24) = v19;
                v18 -= 24;
                *(void *)(v16 - 16) = 0;
                *(void *)(v16 - 8) = 0;
                *(void *)(v16 - 24) = 0;
                v16 -= 24;
              }
              while (v16 != v17);
              int64x2_t v20 = v33;
            }
            unint64_t v21 = v14 + 24;
            v33.i64[0] = v18;
            v33.i64[1] = v14 + 24;
            *(int64x2_t *)&v35.__begin_ = v20;
            v22 = v34;
            v34 = (std::string *)(v12 + 24 * v13);
            v35.__end_cap_.__value_ = v22;
            v35.__first_ = (std::__split_buffer<std::string>::pointer)v20.i64[0];
            std::__split_buffer<std::string>::~__split_buffer(&v35);
            v33.i64[1] = v21;
            if (SHIBYTE(v28) < 0) {
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v9 = *(_OWORD *)__p;
            *(void *)(v33.i64[1] + 16) = v28;
            _OWORD *v8 = v9;
            v33.i64[1] = (uint64_t)v8 + 24;
          }
        }
        uint64_t v5 = [a4 countByEnumeratingWithState:&v29 objects:v36 count:16];
      }
      while (v5);
    }
    std::string::basic_string[abi:nn180100]<0>(&v35, (char *)objc_msgSend(a3, "UTF8String", v23));
    if (v33.i64[0] == v33.i64[1]) {
      __assert_rtn("coalescingConnectionKeyForHostWithDNSRecord", "HTTP2CoalescingSupport.mm", 143, "!DNSRecordIPAddresses.empty()");
    }
    CoalescingDomain::_find_coalescing_connection_key(a1, v24 + 8, (uint64_t)&v35, v33.i64[0], (void *)v33.i64[1]);
    if (SHIBYTE(v35.__end_) < 0) {
      operator delete(v35.__first_);
    }
    v35.__first_ = (std::__split_buffer<std::string>::pointer)&v33;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v35);
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
}

@end