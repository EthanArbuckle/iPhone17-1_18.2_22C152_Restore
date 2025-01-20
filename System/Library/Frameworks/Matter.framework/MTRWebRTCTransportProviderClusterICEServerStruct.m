@interface MTRWebRTCTransportProviderClusterICEServerStruct
- (MTRWebRTCTransportProviderClusterICEServerStruct)init;
- (NSArray)urls;
- (NSNumber)caid;
- (NSString)credential;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCaid:(id)a3;
- (void)setCredential:(id)a3;
- (void)setUrls:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation MTRWebRTCTransportProviderClusterICEServerStruct

- (MTRWebRTCTransportProviderClusterICEServerStruct)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRWebRTCTransportProviderClusterICEServerStruct;
  v4 = [(MTRWebRTCTransportProviderClusterICEServerStruct *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    urls = v4->_urls;
    v4->_urls = (NSArray *)v5;

    username = v4->_username;
    v4->_username = 0;

    credential = v4->_credential;
    v4->_credential = 0;

    caid = v4->_caid;
    v4->_caid = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRWebRTCTransportProviderClusterICEServerStruct);
  v7 = objc_msgSend_urls(self, v5, v6);
  objc_msgSend_setUrls_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_username(self, v9, v10);
  objc_msgSend_setUsername_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_credential(self, v13, v14);
  objc_msgSend_setCredential_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_caid(self, v17, v18);
  objc_msgSend_setCaid_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: urls:%@; username:%@; credential:%@; caid:%@; >",
    v5,
    self->_urls,
    self->_username,
    self->_credential,
  v7 = self->_caid);

  return v7;
}

- (NSArray)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (NSNumber)caid
{
  return self->_caid;
}

- (void)setCaid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caid, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_username, 0);

  objc_storeStrong((id *)&self->_urls, 0);
}

@end