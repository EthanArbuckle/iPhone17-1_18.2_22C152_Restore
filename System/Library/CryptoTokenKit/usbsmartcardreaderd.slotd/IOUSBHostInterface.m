@interface IOUSBHostInterface
- (CCIDDescriptorView)CCIDDescriptor;
- (NSArray)pipes;
- (Properties)properties;
@end

@implementation IOUSBHostInterface

- (CCIDDescriptorView)CCIDDescriptor
{
  AssociatedDescriptorWithType = IOUSBGetNextAssociatedDescriptorWithType([(IOUSBHostInterface *)self configurationDescriptor], (const IOUSBDescriptorHeader *)[(IOUSBHostInterface *)self interfaceDescriptor], 0, 0x21u);
  if (AssociatedDescriptorWithType)
  {
    p_bLength = &AssociatedDescriptorWithType->bLength;
    bLength = (void *)AssociatedDescriptorWithType->bLength;
    if ((void *)+[CCIDDescriptorView length] == bLength)
    {
      v5 = [[CCIDDescriptorView alloc] initWithBytes:p_bLength length:*p_bLength];
      goto LABEL_9;
    }
    v6 = sub_1000034C8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100016498();
    }
  }
  else
  {
    v6 = sub_1000034C8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100016464();
    }
  }

  v5 = 0;
LABEL_9:

  return v5;
}

- (NSArray)pipes
{
  v3 = objc_opt_new();
  EndpointDescriptor = IOUSBGetNextEndpointDescriptor([(IOUSBHostInterface *)self configurationDescriptor], [(IOUSBHostInterface *)self interfaceDescriptor], 0);
  if (EndpointDescriptor)
  {
    v5 = (const IOUSBDescriptorHeader *)EndpointDescriptor;
    while (1)
    {
      uint64_t bLength = v5[1].bLength;
      id v12 = 0;
      v7 = [(IOUSBHostInterface *)self copyPipeWithAddress:bLength error:&v12];
      id v8 = v12;
      if (!v7) {
        break;
      }
      [v3 addObject:v7];

      v5 = (const IOUSBDescriptorHeader *)IOUSBGetNextEndpointDescriptor([(IOUSBHostInterface *)self configurationDescriptor], [(IOUSBHostInterface *)self interfaceDescriptor], v5);
      if (!v5) {
        goto LABEL_5;
      }
    }
    v10 = sub_1000034C8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000164CC();
    }

    id v9 = 0;
  }
  else
  {
LABEL_5:
    id v9 = v3;
  }

  return (NSArray *)v9;
}

- (Properties)properties
{
  v3 = [Properties alloc];
  v4 = [[IOKitObjectHolder alloc] initWithObject:[(IOUSBHostInterface *)self ioService]];
  v5 = [(Properties *)v3 initWithService:v4];

  return v5;
}

@end