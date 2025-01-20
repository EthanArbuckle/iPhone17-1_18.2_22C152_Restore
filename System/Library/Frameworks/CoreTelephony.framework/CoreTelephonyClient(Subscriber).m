@interface CoreTelephonyClient(Subscriber)
@end

@implementation CoreTelephonyClient(Subscriber)

- (void)context:()Subscriber isProtectedIdentitySupported:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18444A000, v0, v1, "nil argument provided for service", v2, v3, v4, v5, v6);
}

- (void)createEncryptedIdentity:()Subscriber identity:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18444A000, v0, v1, "nil argument provided for identity", v2, v3, v4, v5, v6);
}

- (void)copyMobileSubscriberIsoCountryCode:()Subscriber error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18444A000, v0, v1, "nil argument provided for MCC", v2, v3, v4, v5, v6);
}

- (void)copyMobileSubscriberIsoSubregionCode:()Subscriber MNC:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18444A000, v0, v1, "nil argument provided for MCC or MNC", v2, v3, v4, v5, v6);
}

- (void)saveSIMLockValue:()Subscriber enabled:pin:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18444A000, v0, v1, "nil argument provided for PIN", v2, v3, v4, v5, v6);
}

- (void)unlockPUK:()Subscriber puk:newPin:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18444A000, v0, v1, "nil argument provided for PUK or PIN", v2, v3, v4, v5, v6);
}

- (void)setLabel:()Subscriber label:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18444A000, v0, v1, "nil argument provided for label", v2, v3, v4, v5, v6);
}

- (void)generateAuthenticationInfoUsingSim:()Subscriber authParams:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18444A000, v0, v1, "nil argument provided for authentication parameters", v2, v3, v4, v5, v6);
}

- (void)copyMccOrPlmnsListForIso3CountryCode:()Subscriber error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18444A000, v0, v1, "nil argument provided for ISO", v2, v3, v4, v5, v6);
}

- (void)isSimMatching:()Subscriber carrierDescriptors:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18444A000, v0, v1, "nil argument provided for carrier descriptors", v2, v3, v4, v5, v6);
}

@end