@interface MechanismManagerACMResult
- (MechanismBase)mechanism;
- (MechanismManagerACMResult)initWithMechanism:(id)a3 availableMechanisms:(id)a4 mechanismTree:(id)a5 internalInfo:(id)a6;
- (NSDictionary)availableMechanisms;
- (NSDictionary)internalInfo;
- (NSString)mechanismTree;
@end

@implementation MechanismManagerACMResult

- (MechanismManagerACMResult)initWithMechanism:(id)a3 availableMechanisms:(id)a4 mechanismTree:(id)a5 internalInfo:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MechanismManagerACMResult;
  v15 = [(MechanismManagerACMResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mechanism, a3);
    objc_storeStrong((id *)&v16->_availableMechanisms, a4);
    objc_storeStrong((id *)&v16->_mechanismTree, a5);
    objc_storeStrong((id *)&v16->_internalInfo, a6);
  }

  return v16;
}

- (MechanismBase)mechanism
{
  return self->_mechanism;
}

- (NSDictionary)availableMechanisms
{
  return self->_availableMechanisms;
}

- (NSString)mechanismTree
{
  return self->_mechanismTree;
}

- (NSDictionary)internalInfo
{
  return self->_internalInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalInfo, 0);
  objc_storeStrong((id *)&self->_mechanismTree, 0);
  objc_storeStrong((id *)&self->_availableMechanisms, 0);

  objc_storeStrong((id *)&self->_mechanism, 0);
}

@end