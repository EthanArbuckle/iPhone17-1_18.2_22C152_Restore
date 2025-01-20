@interface _WKAutomationSessionConfiguration
- (BOOL)acceptInsecureCertificates;
- (BOOL)allowsInsecureMediaCapture;
- (BOOL)suppressesICECandidateFiltering;
- (_WKAutomationSessionConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAcceptInsecureCertificates:(BOOL)a3;
- (void)setAllowsInsecureMediaCapture:(BOOL)a3;
- (void)setSuppressesICECandidateFiltering:(BOOL)a3;
@end

@implementation _WKAutomationSessionConfiguration

- (_WKAutomationSessionConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)_WKAutomationSessionConfiguration;
  result = [(_WKAutomationSessionConfiguration *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_acceptInsecureCertificates = 256;
    result->_suppressesICECandidateFiltering = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAcceptInsecureCertificates:", -[_WKAutomationSessionConfiguration acceptInsecureCertificates](self, "acceptInsecureCertificates"));
  objc_msgSend(v4, "setAllowsInsecureMediaCapture:", -[_WKAutomationSessionConfiguration allowsInsecureMediaCapture](self, "allowsInsecureMediaCapture"));
  objc_msgSend(v4, "setSuppressesICECandidateFiltering:", -[_WKAutomationSessionConfiguration suppressesICECandidateFiltering](self, "suppressesICECandidateFiltering"));
  return v4;
}

- (BOOL)acceptInsecureCertificates
{
  return self->_acceptInsecureCertificates;
}

- (void)setAcceptInsecureCertificates:(BOOL)a3
{
  self->_acceptInsecureCertificates = a3;
}

- (BOOL)allowsInsecureMediaCapture
{
  return self->_allowsInsecureMediaCapture;
}

- (void)setAllowsInsecureMediaCapture:(BOOL)a3
{
  self->_allowsInsecureMediaCapture = a3;
}

- (BOOL)suppressesICECandidateFiltering
{
  return self->_suppressesICECandidateFiltering;
}

- (void)setSuppressesICECandidateFiltering:(BOOL)a3
{
  self->_suppressesICECandidateFiltering = a3;
}

@end