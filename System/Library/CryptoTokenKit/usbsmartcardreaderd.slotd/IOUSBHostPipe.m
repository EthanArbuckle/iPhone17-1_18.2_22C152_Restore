@interface IOUSBHostPipe
- (id)receive:(unint64_t)a3 timeout:(id)a4;
- (int)endpointDirection;
- (int)endpointType;
- (unint64_t)send:(id)a3 timeout:(id)a4;
@end

@implementation IOUSBHostPipe

- (int)endpointType
{
  return IOUSBGetEndpointType((const IOUSBEndpointDescriptor *)((char *)[(IOUSBHostPipe *)self descriptors]+ 2));
}

- (int)endpointDirection
{
  return IOUSBGetEndpointDirection((const IOUSBEndpointDescriptor *)((char *)[(IOUSBHostPipe *)self descriptors]+ 2));
}

- (unint64_t)send:(id)a3 timeout:(id)a4
{
  id v6 = a4;
  v7 = +[NSMutableData dataWithData:a3];
  if (v6) {
    [v6 doubleValue];
  }
  else {
    double v8 = 5.0;
  }
  id v14 = 0;
  unint64_t v15 = 0;
  unsigned __int8 v9 = [(IOUSBHostPipe *)self sendIORequestWithData:v7 bytesTransferred:&v15 completionTimeout:&v14 error:v8];
  id v10 = v14;

  if ((v9 & 1) == 0)
  {
    v11 = sub_1000034C8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100016534();
    }
  }
  unint64_t v12 = v15;

  return v12;
}

- (id)receive:(unint64_t)a3 timeout:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(IOUSBHostPipe *)self endpointType];
  double v8 = +[NSMutableData dataWithLength:a3];
  if (v6) {
    [v6 doubleValue];
  }
  else {
    double v9 = 5.0;
  }
  id v15 = 0;
  uint64_t v16 = 0;
  unsigned __int8 v10 = [(IOUSBHostPipe *)self sendIORequestWithData:v8 bytesTransferred:&v16 completionTimeout:&v15 error:v9];
  id v11 = v15;
  if (v10)
  {
    unint64_t v12 = objc_msgSend(v8, "subdataWithRange:", 0, v16);
  }
  else
  {
    if (v7 != 3)
    {
      v13 = sub_1000034C8();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10001659C();
      }
    }
    unint64_t v12 = 0;
  }

  return v12;
}

@end